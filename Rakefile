name = "MTFontIcon"
test_project = "MTFontIconTests"
scheme = "MTFontIconTests"

namespace :test do
  task :prepare do
    system(%Q{mkdir -p "Tests/#{test_project}.xcodeproj/xcshareddata/xcschemes" && cp Tests/Schemes/*.xcscheme "Tests/#{test_project}.xcodeproj/xcshareddata/xcschemes/"})
  end

  desc "Run the #{name} Tests for iOS"
  task :ios => :prepare do
    $ios_success = system("xctool -workspace #{name}.xcworkspace -scheme '#{scheme}' -sdk iphonesimulator -configuration Release test -test-sdk iphonesimulator")
  end

end

desc "Run the #{name} Tests for iOS"
task :test => ['test:ios'] do
  puts "\033[0;31m! Tests failed" unless $ios_success
  if $ios_success
    puts "\033[0;32m** All tests executed successfully **"
  else
    exit(-1)
  end
end

task :default => 'test'