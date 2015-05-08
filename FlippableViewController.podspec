Pod::Spec.new do |s|
  s.name         = "FlippableViewController"
  s.version      = "1.0.0"
  s.summary      = "A view controller that allows easy flipping between two child view controllers."

  s.description  = <<-DESC
                   FlippableViewController is a UIViewController subclass that allows easy flipping between two child view controller that are passed in during the init phase.
                   DESC
  s.homepage     = "https://github.com/jmenter/FlippableViewController"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Jeff Menter" => "jmenter@gmail.com" }
  s.social_media_url = "http://twitter.com/jmenter"
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/jmenter/FlippableViewController.git", :tag => s.version.to_s }
  s.source_files  = 'Classes', 'Classes/**/*.{h,m,png,swift}'
  s.requires_arc = true

end
