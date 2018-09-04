# react-native-shared-bridge
A manager to share an `RCTBridge` across the application. The shared bridge manager is responsible for injecting the React Native bundle and creating `RCTRooViews`s which rendering React Native components and can be used as a root view of a `UIViewController`.

### DISCLAIMER

**This project is currently in beta**.

Core APIs are subject to change. We encourage people to try this library out and provide us feedback as we get it to a stable state.

## Getting started

`$ npm install react-native-shared-bridge --save`

### Mostly automatic installation

`$ react-native link react-native-shared-bridge`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-shared-bridge` and add `MSRSharedBridge.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libMSRSharedBridge.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import net.mischneider.MSRSharedBridgePackage;` to the imports at the top of the file
  - Add `new MSRSharedBridgePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-shared-bridge'
  	project(':react-native-shared-bridge').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-shared-bridge/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-shared-bridge')
  	```


## Usage
The following example shows how to use `MSRSharedBaridge` to create root views for a `MSRReactNativeViewController` which is responsible for showing a React Native component.
```objc
@interface MSRReactNativeViewController ()
@property (nonatomic, copy) NSString *moduleName;
@property (nonatomic, copy) NSDictionary<NSString *, id> *initialProperties;
@end

@implementation MSRReactNativeViewController

#pragma mark - Lifecycle

- (instancetype)initWithModuleName:(NSString *)moduleName initialProperties:(NSDictionary<NSString *, id> *)initialProperties
{
  self = [super initWithNibName:nil bundle:nil];
  if (self != nil) {
    _moduleName = [moduleName copy];
    _initialProperties = [initialProperties copy];
  }
  return self;
}

RCT_NOT_IMPLEMENTED(-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil)
RCT_NOT_IMPLEMENTED(-(instancetype)initWithCoder:(nonnull NSCoder *)aDecoder)

#pragma mark - UIViewController

- (void)loadView
{
  // Uses the shared bridge to set the root view
  self.view = [MSRSharedBridge.sharedBridge viewForModuleName:self.moduleName initialProperties:self.initialProperties];
}

@end
```

## License

Copyright 2018 Michael Schneider

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.