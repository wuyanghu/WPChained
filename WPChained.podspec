#
# Be sure to run `pod lib lint WPChained.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WPChained'
  s.version          = '0.1.0'
  s.summary          = '常用属性的链式封装:如UILabel、UIButton、UIBarButtonItem、MutableAttributedString等'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  常用属性的链式封装:如UILabel、UIButton、UIBarButtonItem、MutableAttributedString等
                       DESC

  s.homepage         = 'https://github.com/wuyanghu/WPChained'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '823105162@qq.com' => '823105162@qq.com' }
  s.source           = { :git => 'https://github.com/wuyanghu/WPChained', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WPChained/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WPChained' => ['WPChained/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
