#
#  Be sure to run `pod spec lint dtac-component-ios.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "dtac-component-ios"
  spec.version      = "0.0.6"
  spec.summary      = "dtac Components for iOS helps developers execute dtac design. Developed by a core team of engineers and UX designers at dtac."
  spec.description  = <<-DESC
  dtac Components for iOS helps developers execute dtac design. Developed by a core team of engineers and UX designers at dtac. 🤫
                   DESC
  spec.homepage     = "https://github.com/dtacmobile/dtac-component-ios"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "dtac" => "mobileapp@dtac.co.th" }
  spec.ios.deployment_target = "11.0"
  spec.source       = { :git => "https://github.com/dtacmobile/dtac-component-ios.git", :tag => "#{spec.version}" }

  spec.swift_versions = ['5.0', '5.1']
  spec.source_files  =   "dtac-component-ios/**/*.{h,m,swift}"

end




  
