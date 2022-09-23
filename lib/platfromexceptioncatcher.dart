import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:platfromexceptioncatcher/Interfaces/platform_exception_catcher_interface.dart';

class PlatfromExceptionCatcher {
  /// Initializes the runZonedGuarded to catch platform exceptions
  static init(
    /// mainAppCall accepts entry point of the flutter app [runApp(MyApp())]
    Function mainAppCall, {
    /// url for sending logs to the server
    String? url,
    /// optional headers
    Map<String, String>? headers,
    /// Triggers when platform exception occurs
    Function(Object, StackTrace)? onErrorCallBack,
    /// Triggers when http log post request fails
    Function(Object, StackTrace)? onHttpRequestFailedCallback,
  }) {
    runZonedGuarded(() {
      WidgetsFlutterBinding.ensureInitialized();
      mainAppCall();
    }, (error, stackTrace) {
      log("Unhandled Platfrom Exception", error: error, stackTrace: stackTrace);
      // Handling HTTP post request
      if (url != null) {
        // Runs the http request in another zone to capture the error where url provided is inappropriate.
        runZonedGuarded(() {
          http.post(Uri.parse(url),
              body: {
                'error': error.toString(),
                'stackTrace': stackTrace.toString()
              },
              headers: headers);
        }, ((error, stack) {
          log("Server logging failed...",
              error: error, stackTrace: stack);
          if (onHttpRequestFailedCallback != null) {
            onHttpRequestFailedCallback(error, stack);
          }
        }));
      }
      // custom error callback on triggers when platform exception occurs 
      if (onErrorCallBack != null) {
        onErrorCallBack(error, stackTrace);
      }
    });
  }

  /// returns true if str="success" otherwise false
  /// 
  /// for null argument, generates null pointer exception
  Future<bool> generateNullPointerException(String? str) {
    return PlatformExceptionCatcherInterface.instance.generateNullPointerException(str);
  }
}
