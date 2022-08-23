import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:universal_html/html.dart' as html;
import 'package:video_js_themed/src/view_factory_plugin.dart';
import 'package:video_js_themed/video_js.dart';

class VideoJsWidget extends StatefulWidget {
  final VideoJsController videoJsController;
  final double height;
  final double width;
  final String theme;

  const VideoJsWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.videoJsController,
    this.theme = 'vjs-default-skin',
  }) : super(key: key);

  @override
  VideoJsWidgetState createState() => VideoJsWidgetState();
}

class VideoJsWidgetState extends State<VideoJsWidget> {
  late String elementId;

  @override
  void dispose() {
    widget.videoJsController.dispose();
    html.Element? ele = html.querySelector('#div$elementId');
    if (html.querySelector('#div$elementId') != null) {
      ele!.remove();
    }

    if (kDebugMode) {
      print('VideoJsWidget disposed');
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      elementId = generateRandomString(7);
      // ignore: undefined_prefixed_name1
      ViewFactoryPlugin.platform.registerViewFactory(
        elementId: elementId,
        playerId: widget.videoJsController.playerId,
        theme: widget.theme,
        width: widget.width,
        height: widget.height,
        qualitySelector: widget.videoJsController.qualitySelector,
        videoJsOptions:
            getVideoJsOptions(widget.videoJsController.videoJsOptions),
      );
    }
  }

  /// Get video initial options as a json
  Map<String, dynamic> getVideoJsOptions(VideoJsOptions? videoJsOptions) {
    return videoJsOptions != null ? videoJsOptions.toJson() : {};
  }

  /// To generate random string for HtmlElementView ID
  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: kIsWeb
          ? HtmlElementView(
              viewType: elementId,
            )
          : const Center(
              child: Text('Video_js plugin just supported on web'),
            ),
    );
  }
}
