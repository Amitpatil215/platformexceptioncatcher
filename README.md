## Platform Exception Capture
A Flutter plugin for capturing unhandled errors from Native Android


## Installing
Step 1:
Navigate to project's `pubspec.yaml` file.

Step 2 : Add dependancy
```
platfromexceptioncatcher:
    git:
        url: https://github.com/Amitpatil215/platformexceptioncatcher.git
```

Step 3:
Get the packages
```
flutter pub get
```

Step 4:

Now in your Dart code, you can use:

```
import 'package:platfromexceptioncatcher/platfromexceptioncatcher.dart';
```

## How to use?

```
void main() {

  // Initialize PlatfromExceptionCatcher and pass runApp as a positional argument  
  PlatfromExceptionCatcher.init(
    () => runApp(const MyApp()),
    url: "https://anyUrl.com/Api/log",
    onErrorCallBack: ((error, stackTrace) {
        // do something if platform exception occurs
    }),
    onHttpRequestFailedCallback: (error, stackTrace) {
        // do something if loggin to server fails
    },
  );
}
```

## Example App

Step 1 : Clonse the project

Step 2 : Navigate to example

Step 3 : get th epackages and Build the example app

Step 4 : Cick on ```generate Exception Button``` to generate platform exception

App generate ```Null pointer exception``` and plugin logs it to the server at a given `url`
