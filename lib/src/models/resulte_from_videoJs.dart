class ResultFromVideoJs {
  /// Id that set to video.js controller
  final String videoId;

  /// type can be onReady, onEnd, getVolume, isMute, isFull, isPaused, getCurrent, getDuration,
  /// getRemaining, getBuffered, getPoster, onReady
  /// [type] can be video/mp4, video/webm, application/x-mpegURL (for hls videos), ...
  final String type;

  /// result value from javascript side
  final dynamic result;

  ResultFromVideoJs(this.videoId, this.type, this.result);
}
