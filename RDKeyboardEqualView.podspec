Pod::Spec.new do |s|
  s.name             = "RDKeyboardEqualView"
  s.version          = "1.0.0"
  s.summary          = "Easiest way to track keyboard presence!"
  s.description      = "This is AutoLayout-compatible view that keeps it's size to reflect superview's bottom part, covered by keyboard."
  s.homepage         = "https://github.com/ReDetection/RDKeyboardEqualView"
  s.license          = 'MIT'
  s.author           = { "redetection" => "redetection@gmail.com" }
  s.source           = { :git => "https://github.com/ReDetection/RDKeyboardEqualView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/redetection'

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
