#
# Be sure to run `pod lib lint PhoenixClient.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LiveHelpNow"
  s.version          = "0.0.1"
  s.summary          = "LiveHelpNow SDK"
  s.description      = <<-DESC
                        Live Chat SDK for interfacing with LiveHelpNow Services
                       DESC
  s.homepage         = "http://github.com/livehelpnow/ObjCSdk"
  s.license          = 'MIT'
  s.author           = { "Justin Schneck" => "jschneck@mac.com" }
  s.source           = { :git => "https://github.com/livehelpnow/ObjCSdk.git", :tag => "v#{s.version.to_s}"}

  s.osx.deployment_target	= '10.9'
  s.ios.deployment_target	= '7.0'

  s.requires_arc = true

  s.source_files = 'LiveHelpNow', 'LiveHelpNow/**/*.{h,m}'
  s.dependency "PhoenixClient", "1.1.0"
  s.dependency "AFNetworking", "2.6.3"
  s.dependency "AFOAuth2Manager", "2.2.0"
end
