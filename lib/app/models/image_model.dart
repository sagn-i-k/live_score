class ImageModel {
  String id;
  String author;
  String downloadUrl;

  ImageModel({required this.id, required this.author, required this.downloadUrl});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      author: json['author'],
      downloadUrl: json['download_url'],
    );
  }
}