# frozen_string_literal: true

class TDType
  attr_accessor :description, :name, :fields, :result
  def initialize
    @fields = {}
  end

  def is_function
    if name.casecmp(result).zero?
      return false
    else
      return true
    end
  end

  def gen
    string = "///  #{@description}\n"
    if name.casecmp(result).zero?
      string += "public struct #{result}: Codable, Equatable, FunctionResult {\n"
    else
      letters = @name.split('')
      letters.first.upcase!
      @name = letters.join
      string += "public struct #{@name}: Codable, Equatable, TDFunction {\n"
      string += "\tpublic typealias Result = #{result}\n"
    end
    for field in fields.each_value do
      string += "\t///  #{field.description}\n"
      name = field.escaped_name.camel_case
      string += "\tpublic let #{name}: #{field.cased_type}\n"
    end
    string += "\t/// #{@description}\n"
    string += "\t/// - Parameters:\n" unless fields.empty?
    fields.each_value do |field|
      string += "\t///   - #{field.formattedName}: #{field.description}\n"
    end
    string += "\tpublic init("
    for field in fields.each_value do
      string += "#{field.formattedName}: #{field.cased_type}, "
    end
    string = string[0...-2] unless fields.empty?
    string += ") {\n"
    for field in fields.each_value do
      string += "\t\tself.#{field.formattedName} = #{field.escaped_name.camel_case}\n"
    end
    string += "\t}\n}"
    string
  end
end
class TDEnum
  attr_accessor :cases, :name, :description
  def initialize
    @cases = []
  end

  def gen
    string = "///  #{@description}\n"
    unless cases.first.name.camel_case.start_with?(@name.lower_first.camel_case)
      string += "// sourcery: noPrefix = true\n"
    end
    string += "public indirect enum #{name}: Codable, Equatable, FunctionResult, TDEnum, EquatableEnum {\n"
    for enum_case in cases do
      string += "\t///  #{enum_case.description}\n"
      enum_case.fields.each_value do |field|
        string += "\t/// - #{field.formattedName}: #{field.description}\n"
      end
      case_name = enum_case.name.camel_case
      if case_name.start_with?(@name.lower_first.camel_case)
        case_name = case_name[@name.length..-1].lower_first.escaped
      end
      string += "\tcase #{case_name}"
      unless enum_case.fields.empty?
        string += '('
        for field in enum_case.fields.each_value do
          string += "#{field.formattedName}: #{field.cased_type}, "
        end
        string = string[0...-2]
        string += ')'
      end
      string += "\n"
    end
    string += '}'
    string
  end

  def fields
    f = {}
    for c in cases do
      f = f.merge(c.fields)
    end
    return f
  end
end

class Field
  attr_accessor :description, :name, :type, :is_in_function
  def formattedName
    @name.camel_case
 end

  def escaped_name
    return '`protocol`' if @name == 'protocol'
    return '`subscript`' if @name == 'subscript'
    @name
  end

  def cased_type
    @type = 'TDInt64' if @type == 'int64'
    @type = @type.un_vector
    letters = @type.split('')
    letters.first.upcase!
    return letters.join + '?' if @description.include?('may be null') || @description.include?('for bots only') || @is_in_function
    letters.join
  end
end

class String
  def camel_case
    split('_').inject([]) { |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
  end

  def escaped
    return '`protocol`' if self == 'protocol'
    return '`private`' if self == 'private'
    return '`subscript`' if self == 'subscript'
    return '`default`' if self == 'default'
    self
   end

  def lower_first
    letters = split('')
    letters.first.downcase!
    letters.join
  end

  def un_vector
    vector_match = scan(/^vector<(.+?)>$/)[0]
    if vector_match && !vector_match.empty?
      letters = vector_match[0].un_vector.split('')
      letters.first.upcase!
      return "[#{letters.join}]"
    end
    self
  end
end
all = []
current = nil
comment_string = ''
File.readlines('../Carthage/Checkouts/TDJSON/td_api.tl').each do |line|
  if line.length > 1
    if line.start_with?('//')
      comment_string = comment_string + ' ' + line[2..-2]
    else
      unless comment_string.empty?
        comment_string.scan(/@(.+?)\s([^@]+)/) do |match|
          if match[0] == 'class'
            all.push(current) if current
            current = TDEnum.new
            current.name = match[1].strip
          elsif match[0] == 'description'
            if current.instance_of?(TDEnum) && !current.description
              current.description = match[1]
            else
              type = TDType.new
              type.description = match[1]
              if current.instance_of?(TDEnum)
                current.cases.push(type)
              else
                all.push(current) if current
                current = type
              end
            end
          else
            field = Field.new
            field.name = match[0].strip
            field.name = 'description' if field.name == 'param_description'
            field.description = match[1]
            if current.instance_of?(TDEnum)
              current.cases.last.fields[field.name] = field
            else
              current.fields[field.name] = field
            end
          end
        end
        comment_string = ''
      end
      type_match = line.scan(/^([^\s]+?)\s([^=]*?)\=\s(.+?)\;$/)[0]
      if current && type_match && type_match.length >= 3
        current_enum = nil
        if current.instance_of?(TDEnum)
          current_enum = current
          current = current_enum.cases.last
        end
        current.name = type_match[0]
        current.result = type_match[2]
        type_match[1].scan(/(([^\s\:]+?)\:([^\s]+))/) do |match|
          name = match[1]
          field = current.fields[name]
          field.type = match[2]
          current.fields[name] = field
        end
        if current_enum
          if current.result != current_enum.name
            current_enum.cases.delete(current_enum.cases.last)
            all.push(current_enum)
          else
            current = current_enum
          end
        end
      end
    end
  end
end
all.push(current) if current
current = nil

for ele in all do
  if ele.instance_of? TDType and ele.is_function
      children = ele.fields.map { |key, value| value }
      while children.length > 0 do
        field = children.shift
        if not field.is_in_function
          field.is_in_function = true
          type = all.find { |t| t.name == field.type }
          unless type.nil?
            children += type.fields.map { |key, value| value }
          end
        end
      end
  end
end



File.open('../TDLib/Generated/TDLib.generated.swift', 'w') do |file|
  file.write("public typealias Int53 = Int64\n")
  file.write("public typealias Bytes = Data\n\n")
  for type in all do
    puts type.gen
    file.write(type.gen + "\n\n")
  end
end
puts `cd .. && sourcery`
