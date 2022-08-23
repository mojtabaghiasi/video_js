# Flutter Video.js player with theme support

Flutter plugin for use [Video.js](https://github.com/videojs/video.js) in flutter web with theme support

<img src="https://github.com/PROGrand/video_js/blob/master/doc/demo_image.png?raw=true" width="500">


## Installation

Add it to your package's pubspec.yaml file

```yml
dependencies:
  video_js_themed: ^0.0.1
```

### Web

To implement you need to include Video.js with theme library in the index.html of web section

```javascript
    <link href="https://unpkg.com/video.js@7.20.2/dist/video-js.min.css" rel="stylesheet">
    <link href="https://unpkg.com/@videojs/themes@1/dist/fantasy/index.css" rel="stylesheet">
    <script src="https://unpkg.com/video.js@7.20.2/dist/video.min.js"></script>
```


Example:

```html

<head>
	<base href="$FLUTTER_BASE_HREF">

	<meta charset="UTF-8">
	<meta content="IE=Edge" http-equiv="X-UA-Compatible">
	<meta name="description" content="A new Flutter project.">

	<!-- iOS meta tags & icons -->
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-title" content="example">
	<link rel="apple-touch-icon" href="icons/Icon-192.png">

	<title>example</title>

	<link rel="manifest" href="manifest.json">
    <link href="https://unpkg.com/video.js@7.20.2/dist/video-js.min.css" rel="stylesheet">          <!-- Add this line-->
    <link href="https://unpkg.com/@videojs/themes@1/dist/fantasy/index.css" rel="stylesheet">       <!-- Add this line-->
    <script src="https://unpkg.com/video.js@7.20.2/dist/video.min.js"></script>                     <!-- Add this line-->
</head>
```

*Note*
See usage [example](https://github.com/PROGrand/video_js/tree/master/example) in video_js plugin

Then do this in main method :

```dart
void main() {
  // this line need for javascript's call backs
  VideoJsResults().init();
  runApp(MyApp());
}
```
## Example

```dart
import 'package:flutter/material.dart';
import 'package:videojs_themed/videojs.dart';

void main(){
  VideoJsResults().init();
  runApp(VideoApp());
}

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoJsController _videoJsController;

  @override
  void initState() {
    super.initState();
    _videoJsController = VideoJsController("videoId", videoJsOptions: VideoJsOptions(
        controls: true,
        loop: false,
        muted: false,
        aspectRatio: '16:9',
        fluid: false,
        language: 'en',
        liveui: false,
        notSupportedMessage: 'this movie type not supported',
        preferFullWindow: false,
        responsive: false,
        sources: [Source("https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8",
            "application/x-mpegURL")],
        suppressNotSupportedError: false));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video JS with theme Demo',
      home: Scaffold(
        body: Center(
            child: VideoJsWidget(
              videoJsController: _videoJsController,
              height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width / 1.5,
              theme: 'vjs-theme-fantasy'
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _videoJsController.isPaused((isPlaying) {
              isPlaying != 'true'
                  ? _videoJsController.pause()
                  : _videoJsController.play();
            });
          },
         child: const Icon(Icons.play_arrow,),
        ),
      ),
    );
  }
}
```


*Note*: This plugin is still under development, and some APIs might not be available yet.
[Feedback welcome](https://github.com/PROGrand/video_js/issues) and
[Pull Requests](https://github.com/PROGrand/video_js/pulls) are most welcome!
[Original video_js](https://github.com/mojtabaghiasi/video_js)

