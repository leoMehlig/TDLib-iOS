require 'nokogiri'
require 'open-uri'
categrories = [
    "login", "chat_list", "private_chats", "groups_and_channels", "profile", "settings", 
    "camera_and_media", "bots_and_payments", "general", "unsorted"
]
languages = [
    "en", "de", "fr"
]
languages.each do | language |
    File.open("../../../StatisticsTelegram/#{language}.lproj/Localizable.strings", "w") do | file |
        categrories.each do | category |
            file.write("// #{language} - #{category}\n")
            doc = Nokogiri::HTML(open("https://translations.telegram.org/#{language}/ios/#{category}/"))
            doc.xpath('//div[@class = "tr-value-body"]').each do | body |
                value_element = body.xpath('.//div[@class = "tr-value-suggestions"]/div[@class = "tr-value"]//span[@class = "value"]').first
                unless value_element
                    value_element = body.xpath('.//div[@class = "tr-value-default"]//span[@class = "value"]').first
                end
                key = body.xpath('div[@class = "tr-value-key"]').first.text
                value = value_element.text.gsub("\"", "\\\"")
                puts "\"#{key}\" = \"#{value}\";"
                file.write("\"#{key}\" = \"#{value}\";\n")
            end
        end
    end
end
puts "finished!!!"