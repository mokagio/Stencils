workspace "Stencils.xcworkspace"

def stencils_pod 
  pod "Stencils", :path => "."
end

xcodeproj "Tests/Tests.xcodeproj"
target :StencilsTests, :exclusive => true do
  stencils_pod
  pod "Kiwi/XCTest"
end

target :Example do
  xcodeproj "Example/Example.xcodeproj"
  stencils_pod
  pod 'OpenSans', '1.0.0'
  pod 'UIColor+FlatColors', '0.0.1'
end

target :IconSettings do
  xcodeproj "IconSettings/IconSettings.xcodeproj"
  stencils_pod
end

