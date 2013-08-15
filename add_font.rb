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
# add font to Resources group (create if none exists) xcs + thor
# add custom font to Info.plist
# generate MTFontIcon.plist
# add MTFontIcon.plist to project

# print instructions to complete the setup

require 'fileutils'

usage = "Usage: add_font.rb project_name path_to_font"

project_suffix = ".xcodeproj/project.pbxproj"
project_info_plist_suffix = "-Info.plist"

font_folder = "/Resources/FontIcon"

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
FileUtils.mkdir_p font_folder
FileUtils.cp font_path, font_folder
