#
# Be sure to run `pod lib lint SIBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'SIBase'
    s.version          = '0.1.36'
    s.summary          = 'SIBase.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'http://superid.cn:81/iOS/SIBase'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'ungacy' => 'yetao@superid.cn' }
    s.source = { :git => 'git@git.superid.cn:iOS/SIBase.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '8.0'
    s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.1'}
    s.source_files = 'SIBase/Classes/*.{h,m,swift}'
    s.public_header_files = 'SIBase/Classes/*.h'
    
    s.dependency 'SIUIKit'
    s.dependency 'SITheme'
    s.dependency 'SIRequestCenter'
    s.dependency 'SIRequestKit/Affair'
    s.dependency 'SIDefine'
    s.dependency 'SICollector'
    
end
