class Source {
  /// video source for streaming ( e.g. http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4 )
  final String src;

  /// video type for streaming ( e.g. video/mp4 )
  final String type;

  Source(this.src, this.type);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = "\"${this.src}\"";
    data['type'] = "\"${this.type}\"";
    return data;
  }
}
