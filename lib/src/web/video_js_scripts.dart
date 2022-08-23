class VideoJsScripts {
  String videojsCode(
    String playerId,
    Map<String, dynamic>? options, {
    bool qualitySelector = false,
  }) =>
      """
    var player = videojs('$playerId', $options,function() {
    callBackToDartSide('$playerId', 'onReady' , 'true');
    });
    ${qualitySelector ? """player.hlsQualitySelector({
      displayCurrentQuality: true,
    });""" : ""}
    """;

  String globalAutoSetup(bool status) => """
    videojs.options.autoSetup = '$status';""";

  String globalAutoPlay(bool status) => """
    videojs.options.autoplay = '$status';""";

  String globalControlsStatus(bool status) => """
    videojs.options.controls = '$status';""";

  String globalPreload(String val) => """
    videojs.options.preload = '$val';""";

  String onReady(String playerId) => """
    var player = videojs.getPlayer('$playerId');    
    player.on('ready', function() {
    callBackToDartSide('$playerId', 'onReady' , 'true');
    });""";

  String onEnd(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.on('ended', function() {
    callBackToDartSide('$playerId', 'onEnd' , 'true');
    });""";

  String dispose(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    if(!player.isDisposed()){ player.dispose();}""";

  // String isDispose(String playerId) => """
  //   '$playerId'.isDisposed();""";

  String setSRCCode(String playerId, String src, String type) => """
    var player = videojs.getPlayer('$playerId');
    player.src({type: '$type', src: '$src'});""";

  //Array of Source Objects: To provide multiple versions of the source so that it can be played
  //using HTML5 across browsers you can use an array of source objects. Video.js will detect which
  //version is supported and load that file.
  // String setMultiSRC(String playerId, List<String> sources, List<String> types) => """
  //   var player = videojs.getPlayer('$playerId');
  //   myPlayer.src([
  //     {type: 'video/mp4', src: 'http://www.example.com/path/to/video.mp4'},
  //     {type: 'video/webm', src: 'http://www.example.com/path/to/video.webm'},
  //     {type: 'video/ogg', src: 'http://www.example.com/path/to/video.ogv'}
  //   ]);    """;

  //volume 0 until 1
  String getVolume(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    var volume = player.volume();
    callBackToDartSide('$playerId', 'getVolume' , String(volume));
    });""";

  //volume 0 until 1
  String setVolume(String playerId, String volume) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.volume(parseFloat('$volume')); 
    });""";

  String toggleMute(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.muted(player.muted() ? false : true);
    });""";

  String isMute(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    var status = player.muted();
    callBackToDartSide('$playerId', 'isMute' , status);
    });""";

  // set, tell the player it's in fullscreen
  String toggleFullScreenMode(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.isFullscreen(player.isFullscreen() ? false : true);
    });""";

  String isFullScreen(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    callBackToDartSide('$playerId', 'isFull' , String(player.isFullscreen()));
    });""";

  String requestFullscreen(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.requestFullscreen();
    });""";

  String exitFullscreen(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.exitFullscreen();
    });""";

  String play(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.play();
    });""";

  String pause(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.pause();
    });""";

  String isPause(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    var status = player.paused();
    callBackToDartSide('$playerId', 'isPaused' , status);
    });""";

  String getCurrentTime(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    var currentTime = player.currentTime();
    callBackToDartSide('$playerId', 'getCurrent' , currentTime);
    });""";

  String setCurrentTime(String playerId, String timeInSecond) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.currentTime($timeInSecond);
    });""";

  String duration(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    var lengthOfVideo = player.duration();
    callBackToDartSide('$playerId', 'getDuration' , lengthOfVideo);
    });""";

  String remainingTime(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    var lengthOfVideo = player.remainingTime();
    callBackToDartSide('$playerId', 'getRemaining' , lengthOfVideo);
    });""";

  String bufferedPercent(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    var howMuchIsDownloaded = player.bufferedPercent();
    callBackToDartSide('$playerId', 'getBuffered' , howMuchIsDownloaded);
    });""";

  String setPoster(String playerId, String posterImage) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.poster('$posterImage');
    });""";

  String getPoster(String playerId) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    var value = player.poster();
    callBackToDartSide('$playerId', 'getPoster', value);
    });""";
}
