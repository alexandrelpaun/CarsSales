class AnnouncementModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;

  AnnouncementModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
<<<<<<< HEAD
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      // imageUrl: json['images'][0]["src"] as String,
      imageUrl: json['images'] != null
          ? ((json['images'] as List).isNotEmpty
              ? json['images'][0]["src"]
              : null)
          : null,
    );
=======
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        imageUrl: json['images'] != null
            ? ((json['images'] as List).isNotEmpty
                ? json['images'][0]["src"]
                : null)
            : null);
>>>>>>> fc271a778ff5b9a0bb121db06515a43453df6104
  }
}
