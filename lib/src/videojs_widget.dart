import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:videojs/src/web/videojs_controller.dart';
import 'package:videojs/src/web/videojs_scripts.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:videojs/videojs.dart';


class VideoJsWidget extends StatefulWidget {
  final VideoJsController videoJsController;
  final double height;
  final double width;


  const VideoJsWidget({Key? key, required this.height, required this.width,required this.videoJsController}) : super(key: key);

  @override
  VideoJsWidgetState createState() => VideoJsWidgetState();
}

class VideoJsWidgetState extends State<VideoJsWidget> {

  String elementId = Random().nextInt(1000).toString();

  @override
  void dispose() {
    super.dispose();
    widget.videoJsController.dispose();
    html.Element? ele = html.querySelector("#divId");
    if (html.querySelector("#divId") != null) {
      ele!.remove();
    }
  }

  @override
  void initState() {
    super.initState();

  }


  Map<String, dynamic> getVideoJsOptions(VideoJsOptions? videoJsOptions){
    return videoJsOptions != null ? videoJsOptions.toJson() : {};
  }



  @override
  Widget build(BuildContext context) {

    // html.Element? ele = html.querySelector("#${widget.videoJsController.playerId}");
    // if (html.querySelector("#${widget.videoJsController.playerId}") != null) {
    //   ele!.remove();
    // }
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(elementId, (int id) {
      final html.Element htmlElement = html.DivElement()
        ..id = "divId"
        ..children = [
          html.VideoElement()
            ..id = widget.videoJsController.playerId
          // ..preload = "auto"
          // ..controls = true
            ..style.minHeight = "100%"
            ..style.minHeight = "100%"
            ..style.width = "100%"
            ..style.height = "auto"
            ..className = "video-js vjs-default-skin"
            ..dataset = {},
          html.ScriptElement()
            ..innerHtml = VideoJsScripts().videojsCode(widget.videoJsController.playerId, getVideoJsOptions(widget.videoJsController.videoJsOptions))
        ];
      return htmlElement;
    });
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: HtmlElementView(
        viewType: elementId,
      ),
    );
  }
}
