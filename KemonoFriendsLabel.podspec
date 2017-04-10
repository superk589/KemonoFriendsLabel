
Pod::Spec.new do |s|
  s.name         = "KemonoFriendsLabel"
  s.version      = "0.0.2"
  s.summary      = "A subclass of UILabel, drawing text like title in KemonoFriends."
  s.description  = <<-DESC
                   This is a subclass of UILabel. It supports to draw text like title in KemonoFriends.
                   DESC
  s.homepage     = "https://github.com/superk589/KemonoFriendsLabel"
  s.license      = "MIT"
  s.author             = { "zhenkai zhao" => "superk589@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/superk589/KemonoFriendsLabel.git", :tag => "#{s.version}" }
  s.source_files  = "KemonoFriendsLabel/Core/*.swift"
  s.framework  = "UIKit"
end
