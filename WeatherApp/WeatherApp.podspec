Pod::Spec.new do |spec|
  spec.name         = 'WeatherApp'
  spec.version      = '0.0.1'
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.homepage     = 'https://github.com/umeshdhuri/WeatherApp'
  spec.authors      = { 'Umesh Dhuri' => 'umesh.dhuri25@gmail.com' }
  spec.summary      = 'A short description of WeatherApp.'
  spec.source       = { :git => 'https://github.com/umeshdhuri/WeatherApp.git', :tag => '0.0.1' }
  spec.source_files = 'WeatherApp/WeatherApp/**/*.swift'
  spec.ios.deployment_target = '14.0'
  spec.requires_arc = true
  spec.swift_version = '5.7'
  spec.ios.framework  = 'UIKit'
  spec.dependency 'RxSwift', '6.6.0'
end