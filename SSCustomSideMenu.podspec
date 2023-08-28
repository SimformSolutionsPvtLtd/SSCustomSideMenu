#
# Be sure to run `pod lib lint SSCustomSideMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SSCustomSideMenu'
  s.version          = '1.0.0'
  s.summary          = 'Custom Side menu control'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'SSCustomSideMenu is highly customisable and easy to use Side menu control for iOS Applications'
                         DESC

  s.homepage         = 'https://github.com/simformsolutions/SSCustomSideMenu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kunjalsoni-simformsolutions' => 'kunjal.s@simformsolutions.com' }
  s.source           = { :git => 'https://github.com/simformsolutions/SSCustomSideMenu.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_versions = '5.0'

  s.source_files = 'Sources/SSCustomSideMenu/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SSCustomSideMenu' => ['SSCustomSideMenu/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
