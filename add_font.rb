# Script to automate the font addition to the project.

# print instructions to complete the setup

require 'colorize'
require 'fileutils'
require 'plist'
require 'xcoder'
require 'xcode/file_reference'

usage = "Usage: add_font.rb project_name path_to_font"

project_suffix = ".xcodeproj/project.pbxproj"
project_info_plist_suffix = "-Info.plist"

font_folder = "Resources/FontIcon"

# Project
#
project_name = ARGV[0]

if not project_name
	puts usage
	exit(-1)
end

if project_name.include? "/"
	puts usage
	puts "project_name is not a valid project name"
	exit(-1)
end

# look for project.pbxproj
if not File.exists?(project_name + project_suffix)
	puts usage
	puts "No Xcode project found named #{project_name} in the current directory"
end

# look for -Info.plist
if not File.exists?(project_name + "/" + project_name + project_info_plist_suffix)
	puts usage
	puts "No Info.plist file for the project named #{project_name} found in the current directory"
end

# Font
#
font_path = ARGV[1]

if not font_path
	puts usage
	exit(-1)
end

if not File.exists?(font_path)
	puts usage
	puts "No font found at path #{font_path}"
	exit(-1)
end

if not File.extname(font_path) or File.extname(font_path) != '.ttf'
	puts usage
	puts "The given font is not a supported font. Only .tff supported at the moment"
	exit(-1)
end

# 1 - Copy font in the Resources/FontIcon folder
puts "Copying font in the project file system..."
font_folder = "#{project_name}/#{font_folder}"
FileUtils.cp_r font_path, font_folder
font_name = File.basename font_path
puts "\u2714".green + " - Done."

# 2 - Create and traverse to the group FontIcons within the Resources folder
# project = Xcode.project(project_name)
# project.group("#{project_name}/Resources/FontIcons") do
# 	path =  "#{Dir.pwd}/#{font_folder}/#{font_name}"
# 	file_ref = create_file 'name' => font_name, 'path' => path
# 	project.target(project_name).resources_build_phase do
# 	  	add_build_file file_ref
# 	end
# end
# project.save!
puts "It would be nice to automatically add the font to the project using xcoder. The process at the moment gives problems with the path.".yellow
puts "\u26A0 Don't forget to add the font file to the project".yellow

# 3 - Add the font to the apps custom FontIcons
puts "Adding the font to the app's Info.plist file..."
plist_file_name = "#{project_name}/#{project_name}-Info.plist"
plist = Plist::parse_xml(plist_file_name)
if plist
	if plist['UIAppFonts']
		plist['UIAppFonts'].push font_name unless plist['UIAppFonts'].include? font_name
	else
		plist['UIAppFonts'] = [font_name]
	end
	plist.save_plist plist_file_name
else
	# TODO - handle missing plist case
end
puts "\u2714".green + " - Done."

# 4 - Generate the font configuration plist
puts "Generating MTFontIcon.plist for you..."
font_plist_name = "MTFontIcon.plist"
font_plist_path = "#{Dir.pwd}/#{font_folder}/#{font_plist_name}"
font_dict = {'font-icons' => [{'icon-name' => 'your-icon-name', 'icon-code' => 'e000'}]}
Plist::Emit::save_plist font_dict, font_plist_path
puts "\u2714".green + " - Done."

# 5 - Add the plist to the porject
# project.group("#{project_name}/Resources/FontIcons") do
# 	file_ref = create_file 'name' => font_plist_name, 'path' => font_plist_path
# 	project.target(project_name).resources_build_phase do
# 	  	add_build_file file_ref
# 	end
# end
# project.save!
puts "It would be nice to automatically add the .plist to the project using xcoder. The process at the moment gives problems with the path.".yellow
puts "\u26A0 Don't forget to add the .plist file to the project".yellow
puts "\n"

puts "\u2714".green + " - MTFontIcon setup in your project complete!"
puts "\n"
puts "Don't forget to populate your MTFontIcon.plist configuration file."
puts "Happy coding! :)"