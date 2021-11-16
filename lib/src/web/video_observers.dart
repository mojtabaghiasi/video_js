import 'dart:async';
import 'dart:js';
import 'package:videojs/src/models/resulte_from_videoJs.dart';


class VideoObservers{

  StreamController<ResulteFromVideoJs> _onVolumeFromJsStream = StreamController<ResulteFromVideoJs>.broadcast();
  StreamController<ResulteFromVideoJs> get onVolumeFromJsStream => _onVolumeFromJsStream;


  VideoObservers._privateConstructor();
  static final VideoObservers _instance = VideoObservers._privateConstructor();
  factory VideoObservers() {
    return _instance;
  }
  
  init(){
    context['callBackToDartSide'] = (playerId , type, value){
      _onVolumeFromJsStream.sink.add(ResulteFromVideoJs(playerId.toString() , type.toString() , value.toString()));
    };
  }

  listenToValueFromJs(String playerId, String type, Function(String) onJsValue) {
    StreamSubscription? subscription;
    subscription = VideoObservers().onVolumeFromJsStream.stream.listen((ResulteFromVideoJs resulteFromVideoJs) {
      // if (playerId == resulteFromVideoJs.videoId && type == resulteFromVideoJs.type) {
        onJsValue(resulteFromVideoJs.resulte);
        subscription!.cancel();
      // }
    });
  }

  close(){
    _onVolumeFromJsStream.close();
  }

}

