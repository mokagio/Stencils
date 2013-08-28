# Script to automate the font addition to the project.

# WIP
#
# Usage: ruby add_font.rb project_name path_to_font
#
# [done] if no path given exit
# [done] if no project given exit
# [done] if no project.pbxproj given exit
# [done] if no project info-plist exit
# [done] copy font in Resources/ (create if no folder exists)
# [done] add font to Resources group (create if none exists) xcs + thor
# [done] add custom font to Info.plist
# generate MTFontIcon.plist
# add MTFontIcon.plist to project

# print instructions to complete the setup

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
font_folder = "#{project_name}/#{font_folder}"
FileUtils.cp_r font_path, font_folder
font_name = File.basename font_path

# 2 - Create and traverse to the group FontIcons within the Resources folder
project = Xcode.project(project_name)
project.group("#{project_name}/Resources/FontIcons") do
	path =  "#{Dir.pwd}/#{font_folder}/#{font_name}"
	file_ref = create_file 'name' => font_name, 'path' => path
	project.target(project_name).resources_build_phase do
	  	add_build_file file_ref
	end
end
project.save!

# 3 - Add the font to the apps custom FontIcons
plist_file_name = "#{project_name}/#{project_name}-Info.plist"
plist = Plist::parse_xml(plist_file_name)
if plist
	if plist['UIAppFonts']
		plist['UIAppFonts'].push font_name
	else
		plist['UIAppFonts'] = [font_name]
	end
	plist.save_plist plist_file_name
else
	# TODO - handle missing plist case
end