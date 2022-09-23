import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../Interfaces/platform_exception_catcher_interface.dart';

/// Method channel for invoking and generating custom platform exceptions
class MethodChannelExceptionCatcherror extends PlatformExceptionCatcherInterface {
  @visibleForTesting
  final methodChannel = const MethodChannel('platfromexceptioncatcher');

  @override
  /// returns true if str="success" otherwise false
  /// if argument is null then generate null pointer exception
  Future<bool> generateNullPointerException(String? str) async {
    final version = await methodChannel.invokeMethod<bool>("nullpointerexceptiongenerator", {
      "str": str
    });
    return version!;
  }
}
