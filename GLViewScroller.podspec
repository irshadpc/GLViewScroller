Pod::Spec.new do |s|
  s.name         = "GLViewScroller"
  s.version      = "0.1"
  s.summary      = "Objective-C implementation to have scrollable UIViewControllers"
  s.description  = <<-DESC
                    Objective-C implementation to have scrollable UIViewControllers, like in SnapChat
                   DESC
  s.homepage     = "http://www.gertjanleemans.com"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Gertjan Leemans' => 'gertjanleemans@gmail.com' }
  s.source       = { :git => "https://github.com/gertjanleemans/GLViewScroller.git", :tag => s.version.to_s }
  s.platform     = :ios
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end
