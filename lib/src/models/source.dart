class Source{
  final String src;
  final String type;

  Source(this.src, this.type);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['src'] = "\"${this.src}\"";
    data['type'] = "\"${this.type}\"";
    return data;
  }
}