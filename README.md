# JSONParsingwithCocoa


## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift, which automates and simplifies the process of using 3rd-party libraries like iOSFireBaseFireStoreDatabase in your projects.You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build JSONParsingwithCocoa.

#### Podfile

To integrate JSONParsingwithCocoa into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'DataList' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire', '~> 4.5'
  # Pods for DataList

  target 'DataListTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DataListUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

```

Then, run the following command:

```bash
$ pod install
