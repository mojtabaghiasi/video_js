import 'dart:io';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ViewFactoryPlugin extends PlatformInterface {
  ViewFactoryPlugin() : super(token: _token);

  static final Object _token = Object();

  static ViewFactoryPlugin _instance = ViewFactoryPlugin._setPlatform();

  static ViewFactoryPlugin get platform => _instance;

  static set platform(ViewFactoryPlugin instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  factory ViewFactoryPlugin._setPlatform() {
    throw UnimplementedError(
      'The current platform "${Platform.operatingSystem}" is not supported by this plugin.',
    );
  }

  void registerViewFactory({
    required String elementId,
    required String playerId,
    required String theme,
    required double width,
    required double height,
    required bool qualitySelector,
    required Map<String, dynamic> videoJsOptions,
  });
}
