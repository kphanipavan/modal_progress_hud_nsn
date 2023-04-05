#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint modal_progress_hud_nsn.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'modal_progress_hud_nsn'
  s.version          = '0.4.0'
  s.summary          = 'A modal progress indicator widget with Sound Null Safety'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/kphanipavan/modal_progress_hud_nsn'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'My Company' => 'kphanipavan@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
