package com.example.platfromexceptioncatcher

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class PaltformExceptionCatcherPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "platfromexceptioncatcher")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "nullpointerexceptiongenerator") {
      setStringVal(call, result)
    } else {
      result.notImplemented()
    }
  }

  private fun setStringVal(call: MethodCall, result: MethodChannel.Result) {
    var str = call.argument<String>("str")!!.toLowerCase();
    if(str=="success")
      result.success(true);
    else
      result.success(false);
}

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
