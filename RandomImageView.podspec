#
# Be sure to run `pod lib lint RandomImageView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RandomImageView"
  s.version          = "0.1.0"
  s.summary          = "Swift subclass of the UIView."

  s.description      = <<-DESC
                      * show images on the random.
                       DESC

  s.homepage         = "https://github.com/recruit-lifestyle/RandomImageView"
  s.license          = 'MIT'
  s.author           = { "Nari" => "na.ju.rights@gmail.com" }
  s.source           = { :git => "https://github.com/recruit-lifestyle/RandomImageView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Fye_design'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'RandomImageView' => ['Pod/Assets/*.png']
  }

end
