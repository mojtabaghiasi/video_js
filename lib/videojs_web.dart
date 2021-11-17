import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
export 'package:videojs/src/videojs_widget.dart';
export 'package:videojs/src/models/videoJs_options.dart';
export 'package:videojs/src/models/source.dart';
export 'package:videojs/src/web/videojs_controller.dart';
export 'package:videojs/src/models/resulte_from_videoJs.dart';

/// Wrapper for video.js plugin
class VideoJsWebPlugin {
  /// Registers [MethodChannel] used to communicate with the platform side.
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel('MojtabaGhiasi/VideoJs', const StandardMethodCodec(), registrar);
    final VideoJsWebPlugin instance = VideoJsWebPlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  /// Handle Method Callbacks from [MethodChannel].
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      default:
        throw PlatformException(
            code: 'Unimplemented',
            details: "The videoJs plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }
}
