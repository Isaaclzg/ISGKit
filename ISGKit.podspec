#
# Be sure to run `pod lib lint ISGKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ISGKit'
  s.version          = '2.0.1'
  s.summary          = 'ISGKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 新增NSObjectSafe https://github.com/jasenhuang/NSObjectSafe
      UIView圆角阴影同时设定
                       DESC

  s.homepage         = 'https://github.com/Isaaclzg/ISGKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Isaaclzg' => 'isaac_gang@163.com' }
  s.source           = { :git => 'https://github.com/Isaaclzg/ISGKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.jianshu.com/u/7e1b920cdac1'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ISGKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ISGKit' => ['ISGKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
