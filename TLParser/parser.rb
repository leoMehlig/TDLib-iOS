class TDType
    attr_accessor :description, :name, :fields, :result
    def initialize()
        @fields = {}
    end

    def gen()
        if name.downcase == result.downcase then
            string = "public struct #{result}: Codable, FunctionResult {\n"
        else
            letters = @name.split('')
            letters.first.upcase!
            @name = letters.join
            string = "public struct #{@name}: Codable, TDFunction {\n"
            string += "\tpublic typealias Result = #{result}\n"
        end
        for field in fields.each_value do
            name = field.escaped_name.camel_case
            string += "\tpublic let #{name}: #{field.cased_type}\n"
        end
        string += "\n\tpublic init("
        for field in fields.each_value do
            string += "#{field.formattedName}: #{field.cased_type}, "
        end
        if !fields.empty? then
            string = string[0...-2]
        end
        string += ") {\n"
        for field in fields.each_value do
            string += "\t\tself.#{field.formattedName} = #{field.escaped_name.camel_case}\n"
        end
        string += "\t}\n}"
        return string
    end
end
class TDEnum
    attr_accessor :cases, :name, :description
    def initialize()
        @cases = []
    end

    def gen()
        string = "public indirect enum #{name}: FunctionResult, TDEnum {\n"
        if !cases.first.name.camel_case.start_with?(@name.lower_first.camel_case) then
            string = "// sourcery: noPrefix = true\n" + string
        end
        for enum_case in cases do
            case_name = enum_case.name.camel_case
            if case_name.start_with?(@name.lower_first.camel_case) then
                case_name = case_name[@name.length..-1].lower_first.escaped
            end
            string += "\tcase #{case_name}"
            if !enum_case.fields.empty? then
                string += "("
                for field in enum_case.fields.each_value do
                    string += "#{field.formattedName}: #{field.cased_type}, "
                end
                string = string[0...-2]
                string += ")"
            end
            string += "\n"
        end
        string += "}"
        return string
    end
end

class Field
     attr_accessor :description, :name, :type
     def formattedName()
        return @name.camel_case
    end

    def escaped_name()
        if @name == "protocol"
            return "`protocol`"
        end
        return @name
    end
    def cased_type()
        if @type == "int64" then
            @type = "TDInt64"
        end 
        @type = @type.un_vector
        letters = @type.split('')
        letters.first.upcase!
        if @description.include?("may be null") then
            return letters.join + "?"
        end
        return letters.join
    end
end

class String
  def camel_case
    self.split('_').inject([]){ |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
  end

   def escaped()
        if self == "protocol"
            return "`protocol`"
        end
        if self == "private"
            return "`private`"
        end
        return self
    end

  def lower_first
    letters = self.split('')
    letters.first.downcase!
    return letters.join
  end

  def un_vector
    vector_match = self.scan(/^vector<(.+?)>$/)[0]
    if vector_match && !vector_match.empty? then
            letters = vector_match[0].un_vector.split('')
            letters.first.upcase!
            return "[#{letters.join}]"
    end
    return self
  end
end
all = []
current = nil
comment_string = ""
File.readlines("td.tl").each do | line |
    if line.length > 1 then
        if line.start_with?("//") then
            comment_string = comment_string + " " + line[2..-2]
        else
            if !comment_string.empty? then
                comment_string.scan(/@(.+?)\s([^@]+)/) do | match |
                    if match[0] == "class" then
                        if current then
                            all.push(current)
                        end
                        current = TDEnum.new
                        current.name = match[1].strip
                    elsif match[0] == "description" then
                        if current.instance_of?(TDEnum) && !current.description then
                            current.description = match[1]
                        else
                            type = TDType.new
                            type.description = match[1]
                            if current.instance_of?(TDEnum) then
                                current.cases.push(type)
                            else
                                if current then
                                    all.push(current)
                                end
                                current = type
                            end
                        end
                    else
                        field = Field.new
                        field.name = match[0].strip
                        if field.name == "param_description" then
                            field.name = "description"
                        end
                        field.description = match[1]
                        if current.instance_of?(TDEnum) then
                            current.cases.last.fields[field.name] = field
                        else
                            current.fields[field.name] = field
                        end
                    end
                end
                comment_string = ""
            end
            type_match = line.scan(/^([^\s]+?)\s([^=]*?)\=\s(.+?)\;$/)[0]
            if current && type_match && type_match.length >= 3 then
                current_enum = nil
                if current.instance_of?(TDEnum) then
                    current_enum = current
                    current = current_enum.cases.last
                end
                current.name = type_match[0]
                current.result = type_match[2]
                type_match[1].scan(/(([^\s\:]+?)\:([^\s]+))/) do | match |
                    name = match[1]
                    field = current.fields[name]
                    field.type = match[2]
                    current.fields[name] = field
                end
                if current_enum then
                    if current.result != current_enum.name then
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
if current then
    all.push(current)
end
current = nil

File.open("../TDLib/Generated/TDLib.generated.swift", "w") do | file |
    file.write("public typealias Int53 = Int64\n")
    file.write("public typealias Bytes = Data\n\n")
    for type in all do
        puts type.gen()
        file.write(type.gen() + "\n\n")
    end
end
puts `cd .. && sourcery`