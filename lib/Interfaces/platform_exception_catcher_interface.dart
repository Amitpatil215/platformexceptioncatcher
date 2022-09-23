import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../MethodChannels/platform_exception_method_channel.dart';

abstract class PlatformExceptionCatcherInterface extends PlatformInterface {
  
  PlatformExceptionCatcherInterface() : super(token: _token);

  static final Object _token = Object();

  static PlatformExceptionCatcherInterface _instance =
      MethodChannelExceptionCatcherror();

  /// Gets an instance of [MethodChannelExceptionCatcherror]
  static PlatformExceptionCatcherInterface get instance => _instance;

  static set instance(PlatformExceptionCatcherInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // A fucntion to generate explicit null pointer exception on passing string as null
  Future<bool> generateNullPointerException(String? str) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
