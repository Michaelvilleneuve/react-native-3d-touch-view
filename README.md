
# react-native-3d-touch-view

## Getting started

`$ npm install react-native-3d-touch-view --save`

### Mostly automatic installation

`$ react-native link react-native-3d-touch-view`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-3d-touch-view` and add `RN3dTouchView.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRN3dTouchView.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RN3dTouchViewPackage;` to the imports at the top of the file
  - Add `new RN3dTouchViewPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-3d-touch-view'
  	project(':react-native-3d-touch-view').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-3d-touch-view/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-3d-touch-view')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RN3dTouchView.sln` in `node_modules/react-native-3d-touch-view/windows/RN3dTouchView.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Com.Reactlibrary.RN3dTouchView;` to the usings at the top of the file
  - Add `new RN3dTouchViewPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RN3dTouchView from 'react-native-3d-touch-view';

// TODO: What to do with the module?
RN3dTouchView;
```
  