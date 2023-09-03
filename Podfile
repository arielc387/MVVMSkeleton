workspace 'MVVMSkeleton'

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
pod 'Resolver', '~> 1.5.0'

target 'OrchestratorApp' do
 
  project 'Presentation/OrchestratorApp/OrchestratorApp.xcodeproj'

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for OrchestratorApp
  pod 'Alamofire', '~> 5.4.4'
 
  
  target 'OrchestratorAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'OrchestratorAppUITests' do
    # Pods for testing
    #inherit! :search_paths
  end

end

target 'UI' do
 
  project 'Presentation/UI/UI.xcodeproj'

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for UI
 
  target 'UITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Domain' do
 
  project 'Domain/Domain/Domain.xcodeproj'

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Domain
  
  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Repositories' do
 
  project 'Data/Repositories/Repositories.xcodeproj'

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Repositories
  
  target 'RepositoriesTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Networking' do
 
  project 'Data/Networking/Networking.xcodeproj'

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Networking
  pod 'Alamofire', '~> 5.4.4'
 
  
  target 'NetworkingTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Common' do
 
  project 'Utils/Common/Common.xcodeproj'

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Common
  
  target 'CommonTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
