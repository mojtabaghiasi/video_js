
class VideoJsScripts {

  // [autoplay]
  // a boolean value of false: the same as having no attribute on the video element, won't autoplay
  // a boolean value of true: the same as having attribute on the video element, will use browsers autoplay
  // a string value of 'muted': will mute the video element and then manually call play() on loadstart. This is likely to work.
  // a string value of 'play': will call play() on loadstart, similar to browsers autoplay
  // a string value of 'any': will call play() on loadstart and if the promise is rejected it will mute the video element then call play().

  // [controls]
  //Determines whether or not the player has controls that the user can interact with. Without controls the only way to start the video
  //playing is with the autoplay attribute or through the Player API.

  // [height]
  // Sets the display height of the video player in pixels.
  String videojsCode(String playerId, Map<String, dynamic>? options) => """
    $playerId = videojs('$playerId', ${options.toString()},function() {
    callBackToDartSide('$playerId', 'onReady' , 'true');
    });""";



  String globalAutoSetup(bool status) => """
    videojs.options.autoSetup = '$status';""";

  String globalAutoPlay(bool status) => """
    videojs.options.autoplay = '$status';""";

  String globalControlsStatus(bool status) => """
    videojs.options.controls = '$status';""";


  String globalPreload(String val) => """
    videojs.options.preload = '$val';""";

  String onReady(String playerId) => """
    var player = videojs('$playerId');    
    player.on('ready', function() {
    callBackToDartSide('$playerId', 'onReady' , 'true');
    });""";

  String onEnd(String playerId) => """
    var player = videojs('$playerId');
    player.on('ended', function() {
    callBackToDartSide('$playerId', 'onEnd' , 'true');
    });""";

  String dispose(String playerId) => """
    var player = videojs('$playerId');
    player.dispose();""";

  // String isDispose(String playerId) => """
  //   '$playerId'.isDisposed();""";

  String setSRCCode(String playerId, String src, String type) => """
    var player = videojs('$playerId');
    player.src({type: '$type', src: '$src'});""";

  //Array of Source Objects: To provide multiple versions of the source so that it can be played
  //using HTML5 across browsers you can use an array of source objects. Video.js will detect which
  //version is supported and load that file.
  // String setMultiSRC(String playerId, List<String> sourses, List<String> types) => """
  //   var player = videojs('$playerId');
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

  //The tech on the player can be accessed via tech(). Passing any argument will silence the warning that is logged.
  String tech(String playerId, bool tech) => """
    var player = videojs.getPlayer('$playerId');
    player.ready(function() {
    player.tech('$tech');
    });""";

}
