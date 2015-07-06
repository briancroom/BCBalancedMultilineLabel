#
# Be sure to run `pod lib lint BCBalancedMultilineLabel.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BCBalancedMultilineLabel"
  s.version          = "0.1.0"
  s.summary          = "A label which draws itself such that each of its lines have as close to the same length as possible."
  s.description      = <<-DESC
                       Have you ever placed a label in your view controller, gave it some nice copy to display, 
                       ran your app and then cringed because everything fit on one line except for one or two
                       lone words? BCBalancedMultilineLabel will take care of adjusting the line breaks such
                       that each line is as close to the same length as possible, making your text look beautiful.
                       DESC
  s.homepage         = "https://github.com/briancroom/BCBalancedMultilineLabel"
  s.screenshots     = "https://github.com/briancroom/BCBalancedMultilineLabel/raw/master/Screenshots/Example-App.png"
  s.license          = 'MIT'
  s.author           = { "Brian Croom" => "brian.s.croom@gmail.com" }
  s.social_media_url = 'https://twitter.com/aikoniv'
  s.source           = { :git => "https://github.com/briancroom/BCBalancedMultilineLabel.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
