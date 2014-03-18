workspace "MTFontIcon.xcworkspace"

xcodeproj "Example/Example.xcodeproj"
target "Example" do
  pod "MTFontIcon", :path => "."
end

target "MTFontIconTests", :exclusive => true do
  xcodeproj "Tests/Tests.xcodeproj"
  pod "MTFontIcon", :path => "."
  pod "Kiwi/XCTest"
end

target "IconSettings" do
  xcodeproj "IconSettings/IconSettings.xcodeproj"
  pod "MTFontIcon", :path => "."
end

