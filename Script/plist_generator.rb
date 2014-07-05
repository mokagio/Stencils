require 'plist'
require 'slop'

options = Slop.parse(:help => true) do
  banner "Usage: plist_generator.rb [options]"

  on "css=", "The CSS file to read (Defaults to style.css)"
  on "font=", "The name of the font (Defaults to icomoon)"
end

file_name = options[:css] ? options[:css] : "style.css"
icon_name_format = ".icon-"
icon_code_format = "content: \"\\"
icon_code_format_alterative = "content: '\\"
font_name = options[:font] ? options[:font] : "icomoon"

icons = []
current_icon = {}

File.read(file_name).lines.each do |line|
  if not current_icon[:name]
    if line.include? icon_name_format

      if line.include? "}"
        split = line.split "{"
        name_line = split[0]
        code_line = split[1].split(";")[0]

        name = name_line.gsub(icon_name_format, "")
          .gsub(":before ", "")
          .chomp
        current_icon[:name] = name

        code = code_line.gsub(icon_code_format, "")
          .gsub(icon_code_format_alterative, "")
          .gsub("'", "")
          .gsub('"', "")
          .lstrip
          .chomp 
        current_icon[:code] = code

        icons.push current_icon
        current_icon = {}
      else
        name = line.gsub(icon_name_format, "")
          .gsub(":before {", "")
          .chomp
        current_icon[:name] = name
      end
    end
  elsif not current_icon[:code]
    if line.include? icon_code_format
      code = line.gsub(icon_code_format, "")
        .gsub("\";", "")
        .lstrip
        .chomp
      current_icon[:code] = code

      icons.push current_icon
      current_icon = {}
    end
  end
end

stencils_data = {}
stencils_data['font-icons'] = []
icons.each do |icon|
  i = {
    'font-name' => font_name,
    'icon-name' => icon[:name],
    'icon-code' => icon[:code],
  }
  stencils_data['font-icons'].push i
end

File.new("Stencils.plist", "w").write(stencils_data.to_plist)

puts "Plist configuration:\n\n"
puts stencils_data.to_plist

reset_color = "\e[0m"
green_color = "\e[1;32m"
message = "All done! You can now add Stencils.plist file that has been generated in this folder in your project."
puts reset_color + "\n" + green_color + message + reset_color
