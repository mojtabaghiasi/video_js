class Source {
  /// video source for streaming ( e.g. http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4 )
  final String src;

  /// video type for streaming ( e.g. video/mp4 )
  final String type;

  Source(this.src, this.type);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['src'] = '"$src"';
    data['type'] = '"$type"';
    return data;
  }
}
