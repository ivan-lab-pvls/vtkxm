class PhotoItem {
  String? id;
  String? photo;

  PhotoItem({this.id, this.photo});

  factory PhotoItem.fromJson(Map<String, dynamic> parsedJson) {
    return PhotoItem(
      id: parsedJson['id'] ?? '',
      photo: parsedJson['photo'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "photo": photo,
    };
  }
}
