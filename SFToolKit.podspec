Pod::Spec.new do |s|
  s.name         = 'SFToolKit'
  s.version      = '0.2.2'
  s.summary      = 'Collection of useful cocoa classes & categories.'
  s.homepage     = 'https://github.com/superflomo/SFToolKit'
  s.author       = { 'Florian Buerger' => 'flo@superflomo.com', 'Moritz Haarmann' => 'mo@superflomo.com' }

  s.license      = 'MIT'
  s.source       = { :git => 'git@github.com:superflomo/SFToolKit.git', :tag => '0.2.1' }

  s.platform     = :ios, '6.0'
  s.source_files = 'SFToolKit/*.{h,m}'
  s.resources = 'SFToolKit/*.{xib}'
  s.requires_arc = true

  s.dependency 'CocoaLumberjack'

end
