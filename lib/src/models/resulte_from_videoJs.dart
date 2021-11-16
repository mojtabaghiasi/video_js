class ResulteFromVideoJs{

  //Id that set to videojs controller
  final String videoId;
  //type can be onReady, onEnd, getVolume, isMute, isFull, isPaused, getCurrent, getDuration,
  //getRemaining, getBuffered, getPoster
  final String type;
  //resulte vaslue from javascript side
  final dynamic resulte;

  ResulteFromVideoJs(this.videoId,this.type, this.resulte);

}