import 'dart:html' as html;

import 'package:videojs/src/models/videoJs_options.dart';
import 'package:videojs/src/web/video_observers.dart';
import 'package:videojs/src/web/videojs_scripts.dart';

class VideoJsController {
  final String playerId;
  final VideoJsOptions? videoJsOptions;

  VideoJsController(this.playerId, {this.videoJsOptions});

  videojs(Function(String) onReady, {VideoJsOptions? videoJsOptions}) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "videojs"
      ..innerHtml = VideoJsScripts().videojsCode(playerId, videoJsOptions!.toJson());
    html.Element? ele = html.querySelector("#videojs");
    if (html.querySelector("#videojs") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'onReady', onReady);
  }

  //to set video source by type
  //[type] can be video/mp4, video/webm, application/x-mpegURL (for hls videos), ...
  setSRC(String src, {required String type}) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "setSRC"
      ..innerHtml = VideoJsScripts().setSRCCode(playerId, src, type);
    html.Element? ele = html.querySelector("#setSRC");
    if (html.querySelector("#setSRC") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  getVolume(Function(String) onVolumeRecive) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "getVolume"
      ..innerHtml = VideoJsScripts().getVolume(playerId);
    html.Element? ele = html.querySelector("#getVolume");
    if (html.querySelector("#getVolume") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'getVolume', onVolumeRecive);
  }

  setVolume(String volume) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "setVolume"
      ..innerHtml = VideoJsScripts().setVolume(playerId, volume);
    html.Element? ele = html.querySelector("#setVolume");
    if (html.querySelector("#setVolume") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  toggleMute() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "toggleMute"
      ..innerHtml = VideoJsScripts().toggleMute(playerId);
    html.Element? ele = html.querySelector("#toggleMute");
    if (html.querySelector("#toggleMute") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  isMute(Function(String) onMuteStatus) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "isMute"
      ..innerHtml = VideoJsScripts().isMute(playerId);
    html.Element? ele = html.querySelector("#isMute");
    if (html.querySelector("#isMute") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'isMute', onMuteStatus);
  }

  toggleFullScreen() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "toggleFullScreen"
      ..innerHtml = VideoJsScripts().toggleFullScreenMode(playerId);
    html.Element? ele = html.querySelector("#toggleFullScreen");
    if (html.querySelector("#toggleFullScreen") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  isFullScreen(Function(String) onFullScreenStatus) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "isFullScreen"
      ..innerHtml = VideoJsScripts().isFullScreen(playerId);
    html.Element? ele = html.querySelector("#isFullScreen");
    if (html.querySelector("#isFullScreen") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'isFull', onFullScreenStatus);
  }

  requestFullScreen() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "requestFullScreen"
      ..innerHtml = VideoJsScripts().requestFullscreen(playerId);
    html.Element? ele = html.querySelector("#requestFullScreen");
    if (html.querySelector("#requestFullScreen") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  exiteFullScreen() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "exiteFullScreen"
      ..innerHtml = VideoJsScripts().exitFullscreen(playerId);
    html.Element? ele = html.querySelector("#exiteFullScreen");
    if (html.querySelector("#exiteFullScreen") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  play() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "play"
      ..innerHtml = VideoJsScripts().play(playerId);
    html.Element? ele = html.querySelector("#play");
    if (html.querySelector("#play") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  pause() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "pause"
      ..innerHtml = VideoJsScripts().pause(playerId);
    html.Element? ele = html.querySelector("#pause");
    if (html.querySelector("#pause") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  isPaused(Function(String) onPauseStatus) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "isPaused"
      ..innerHtml = VideoJsScripts().isPause(playerId);
    html.Element? ele = html.querySelector("#isPaused");
    if (html.querySelector("#isPaused") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'isPaused', onPauseStatus);
  }

  currentTime(Function(String) onCurrentTime) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "currentTime"
      ..innerHtml = VideoJsScripts().getCurrentTime(playerId);
    html.Element? ele = html.querySelector("#currentTime");
    if (html.querySelector("#currentTime") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'getCurrent', onCurrentTime);
  }

  setCurrentTime(String CurrentTime) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "setCurrentTime"
      ..innerHtml = VideoJsScripts().setCurrentTime(playerId, CurrentTime);
    html.Element? ele = html.querySelector("#setCurrentTime");
    if (html.querySelector("#setCurrentTime") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  durationTime(Function(String) onDurationTime) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "durationTime"
      ..innerHtml = VideoJsScripts().duration(playerId);
    html.Element? ele = html.querySelector("#durationTime");
    if (html.querySelector("#durationTime") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'getDuration', onDurationTime);
  }

  remainTime(Function(String) onRemainTime) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "onRemainTime"
      ..innerHtml = VideoJsScripts().remainingTime(playerId);
    html.Element? ele = html.querySelector("#onRemainTime");
    if (html.querySelector("#onRemainTime") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'getRemaining', onRemainTime);
  }

  bufferPercent(Function(String) onBufferPercent) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "bufferPercent"
      ..innerHtml = VideoJsScripts().bufferedPercent(playerId);
    html.Element? ele = html.querySelector("#bufferPercent");
    if (html.querySelector("#bufferPercent") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'getBuffered', onBufferPercent);
  }

  setPoster(String poster) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "setPoster"
      ..innerHtml = VideoJsScripts().setPoster(playerId, poster);
    html.Element? ele = html.querySelector("#setPoster");
    if (html.querySelector("#setPoster") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  getPoster(Function(String) onPosterGet) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "getPoster"
      ..innerHtml = VideoJsScripts().getPoster(playerId);
    html.Element? ele = html.querySelector("#getPoster");
    if (html.querySelector("#getPoster") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
    VideoObservers().listenToValueFromJs(playerId, 'getPoster', onPosterGet);
  }

  tech(bool tech) {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "tech"
      ..innerHtml = VideoJsScripts().tech(playerId, tech);
    html.Element? ele = html.querySelector("#tech");
    if (html.querySelector("#tech") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }

  dispose() {
    final html.Element scriptElement = html.ScriptElement()
      ..id = "dispose"
      ..innerHtml = VideoJsScripts().dispose(playerId);
    html.Element? ele = html.querySelector("#dispose");
    if (html.querySelector("#dispose") != null) {
      ele!.remove();
    }
    html.querySelector('body')!.children.add(scriptElement);
  }
}
