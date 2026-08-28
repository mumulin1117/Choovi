platform :ios, '15.6'

target 'choovicoff' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Adjust', '~> 5.1.1'
  pod 'FBSDKCoreKit', '11.2.1'
  # Pods for choovicoff

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |configuration|
      configuration.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.6'
    end
  end
end
