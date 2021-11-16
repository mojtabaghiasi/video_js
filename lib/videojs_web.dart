import 'dart:async';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
export 'package:videojs/src/videojs_widget.dart';
export 'package:videojs/src/models/videoJs_options.dart';
export 'package:videojs/src/models/source.dart';
export 'package:videojs/src/web/videojs_controller.dart';
export 'package:videojs/src/models/resulte_from_videoJs.dart';

/// Wrapper for video.js plugin
class VideoJsWebPlugin {
  /// Constructor class
  /// which calls the metohd to inject JS and CSS in to dom
  VideoJsWebPlugin() {
    injectCssAndJSLibraries();
  }

  /// Registers [MethodChannel] used to communicate with the platform side.
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel('MojtabaGhiasi/VideoJs', const StandardMethodCodec(), registrar);
    final VideoJsWebPlugin instance = VideoJsWebPlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  /// Handle Method Callbacks from [MethodChannel].
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'showToast':
        return true;
      default:
        throw PlatformException(
            code: 'Unimplemented',
            details: "The videoJs plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }


  /// [injectCssAndJSLibraries] which add the JS and CSS files into DOM
  Future<void> injectCssAndJSLibraries() async {
    final List<Future<void>> loading = <Future<void>>[];
    final List<html.HtmlElement> tags = <html.HtmlElement>[];

    final html.LinkElement css = html.LinkElement()
      ..id = 'videojscss'
      ..attributes = {"rel": "stylesheet"}
      ..href = 'https://unpkg.com/video.js/dist/video-js.css';
    tags.add(css);

    final html.ScriptElement script = html.ScriptElement()
      ..async = true
      // ..defer = true
      ..src = "https://unpkg.com/video.js/dist/video.js";
    final html.ScriptElement script2 = html.ScriptElement()
      ..async = true
      // ..defer = true
      ..src = "https://unpkg.com/videojs-contrib-hls/dist/videojs-contrib-hls.js";
    loading.add(script.onLoad.first);
    loading.add(script2.onLoad.first);
    tags.add(script);
    tags.add(script2);
    html.querySelector('head')!.children.addAll(tags);
    await Future.wait(loading);
  }
}

/// injects Final [Toastify] code with all the parameters to
/// make toast visible on web
addHtmlToast({String msg = "", String? gravity = "top", String position = "right", String bgcolor = "linear-gradient(to right, #00b09b, #96c93d)", int time = 3000, bool showClose = false, int? textColor}) {
  String m = msg.replaceAll("'", "\\'").replaceAll("\n", "<br />");
  html.Element? ele = html.querySelector("#toast-content");
  String content = """
          var toastElement = Toastify({
            text: '$m',
            gravity: '$gravity',
            position: '$position',
            duration: $time,
            close: $showClose,
            backgroundColor: "$bgcolor",
          });
          toastElement.showToast();
        """;
  if (html.querySelector("#toast-content") != null) {
    ele!.remove();
  }
  final html.ScriptElement scriptText = html.ScriptElement()
    ..id = "toast-content"
    ..innerHtml = content;
  html.querySelector('head')!.children.add(scriptText);
  if (textColor != null) {
    html.Element toast = html.querySelector('.toastify')!;
    String tcRadix = textColor.toRadixString(16);
    final String tC = "${tcRadix.substring(2)}${tcRadix.substring(0, 2)}";
    toast.style.setProperty('color', "#$tC");
  }
}
