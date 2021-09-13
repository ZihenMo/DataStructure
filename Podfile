# Uncomment the next line to define a global platform for your project
platform :osx, '10.14'

source "git@github.com:ZihenMo/Specs.git"
source "https://cdn.cocoapods.org/"


target 'DataStructuresAndAlgorithm' do
  # Comment the next line if you don't want to use dynamic frameworks
#   use_frameworks!
#    pod 'DSContainerForObjC', '~> 0.0.3'
   pod 'DSContainerForObjC', :path => '../PodLib/DSContainerForObjC'

  target 'DataStructuresAndAlgorithmUnitTest' do
    inherit! :search_paths
    
     use_frameworks!
    # pod 'DSContainerForObjC', '~> 0.0.3'
   pod 'DSContainerForObjC', :path => '../PodLib/DSContainerForObjC'

  end
end
