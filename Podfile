platform :ios, '8.1'

pod 'Alamofire', '~> 1.1'
pod 'Argo', :git => 'https://github.com/thoughtbot/Argo'
pod 'HanekeSwift', :git => 'https://github.com/frootloops/HanekeSwift'

target :unit_tests, :exclusive => true do
  link_with 'UnitTests'
  pod 'Specta'
  pod 'Expecta'
  pod 'OCMock'
  pod 'OHHTTPStubs'
end
