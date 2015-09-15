#
# Be sure to run `pod lib lint RandomImageView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RandomImageView"
  s.version          = "0.1.0"
  s.summary          = "Swift subclass of the UIImageView."
  s.description      = <<-DESC
                       RandomImageView
                       This library enable user to
                       * temporary storage
                       * quick comparison
                       DESC
  s.homepage         = "https://github.com/recruit-lifestyle/RandomImageView"
  s.license          = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author           = { "Nari" => "na.ju.rights@gmail.com" }
  s.source           = { :git => "https://github.com/recruit-lifestyle/RandomImageView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Fye_design'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*'
  s.resource_bundles = {
    'RandomImageView' => ['Pod/Assets/*.png']
  }
end