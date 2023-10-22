workspace "Stencils.xcworkspace"
platform :ios, "12.0"
use_frameworks!

def stencils_pod
  pod "Stencils", :path => "."
end

xcodeproj "Tests/Tests.xcodeproj"
target :StencilsTests do
  stencils_pod
  pod "Kiwi"
end

target :Example do
  xcodeproj "Example/Example.xcodeproj"
  stencils_pod
  pod 'OpenSans', git: 'git@github.com:mokagio/OpenSans', commit: 'b505071bda9bf8bd21e75e0e3bfeda1b445aa4bc'
  pod 'UIColor+FlatColors', '1.0.0'
end

target :IconSettings do
  xcodeproj "IconSettings/IconSettings.xcodeproj"
  stencils_pod
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # Kiwi (an maybe more) is targeting a too old iOS version.
      #
      # SDK does not contain 'libarclite' at the path
      # '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/arc/libarclite_iphonesimulator.a';
      # try increasing the minimum deployment target
      config.build_settings.delete('IPHONEOS_DEPLOYMENT_TARGET')
    end
  end
end
