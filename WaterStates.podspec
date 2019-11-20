#
# Be sure to run `pod lib lint WaterStates.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WaterStates'
  s.version          = '0.2.4'
  s.summary          = 'Simple and ready-made states for the view controller'

  s.description      = <<-DESC
    Are you sure tired of writing the same code in all view controllers? Now you can easily and simply call up the necessary states for display, WaterStates will do the rest.

    Inside, a StateMachine is used that determines the delay and decides when to show, hide, or skip the state display.

    Instructions for installation are in [the README](https://github.com/BarredEwe/WaterStates).
                       DESC

  s.homepage         = 'https://github.com/BarredEwe/WaterStates'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BarredEwe' => 'grishutin@bifit.com' }
  s.source           = { :git => 'https://github.com/BarredEwe/WaterStates.git', :tag => s.version.to_s }

  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'

  s.source_files = 'WaterStates/Classes/**/*'
  s.resources = ['WaterStates/Assets/**/*.{xib,xcassets}']
  s.resource_bundles = { 'WaterStates' => ['WaterStates/Assets/**/*.{xib,xcassets}'] }

end
