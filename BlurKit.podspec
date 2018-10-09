Pod::Spec.new do |s|
  s.name         = "BlurKit"
  s.version      = "0.1.1"
  s.summary      = "A lightweight library that can easily blur the view."
  s.homepage     = "https://github.com/touyu/BlurKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "touyu" => "dev.akkey0222@gmail.com" }
  s.source       = { :git => "https://github.com/touyu/BlurKit.git", :tag => "#{s.version}" }
  s.source_files  = "BlurKit/**/*.{swift}"
  s.swift_version = "4.2"
  s.platform     = :ios, "10.0"
end
