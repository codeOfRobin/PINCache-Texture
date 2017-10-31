Pod::Spec.new do |s|
  s.name         = "PINCacheTexture"
  s.version      = "0.0.3"
  s.summary      = "Links PINCache to Texture"
  s.description  = "Links PINCache to Texture. Compatible with iOS 8.0 and above"
  s.homepage     = "https://github.com/codeOfRobin/PINCache-Texture"
  s.social_media_url   = "https://twitter.com/codeOfRobin"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Robin Malhotra" => "me@rmalhotra.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/codeOfRobin/PINCache-Texture.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "UIKit"
  s.module_name  = "PINCacheTexture"
  s.dependency "Texture"
  s.dependency "PINCache"
end
