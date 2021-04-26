#
# Be sure to run `pod lib lint dtac-component-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'dtac-component-ios'
  s.version          = '0.9.0'
  s.summary          = 'this is a pod component for use development iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'this is a pod component for use development iOS. 😀'

  s.homepage         = 'https://github.com/dtacmobile/dtac-component-ios'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chakiss' => 'Chakrit69@gmail.com' }
  s.source           = { :git => 'https://github.com/dtacmobile/dtac-component-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = "4.2"
  s.ios.deployment_target = '10.0'

  s.source_files = 'component/source/**/*'
  
  # s.resource_bundles = {
  #   'dtac-component-ios' => ['dtac-component-ios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
