class PhotoModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailURL;

  PhotoModel({
      required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailURL});

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailURL: json['thumbnailURL']
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailURL": thumbnailURL
  };
}
