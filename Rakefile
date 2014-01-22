desc "Tests the project using xcodebuild and xcpretty"
task :test do
  buildtask = "xcodebuild \
    -workspace MTFontIcon.xcworkspace \
    -scheme MTFontIconTests \
    -sdk iphonesimulator \
    -destination 'name=iPhone Retina (4-inch)'"
  system "#{buildtask} test | xcpretty --test --color"  
end

task :default => :test