require 'plist'

file_name = "style.css"
icon_name_format = ".icon-"
icon_code_format = "content: \"\\"

icons = []
current_icon = {}

File.read(file_name).lines.each do |line|
  if not current_icon[:name]
    if line.include? icon_name_format
      name = line.gsub(icon_name_format, "")
        .gsub(":before {", "")
        .chomp
      current_icon[:name] = name
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
    'font-name' => 'icomoon',
    'icon-name' => icon[:name],
    'icon-code' => icon[:code],
  }
  stencils_data['font-icons'].push i
end

puts stencils_data.to_plist

File.new("Stencils.plist", "w").write(stencils_data.to_plist)