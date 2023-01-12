class AnnouncementModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? marks;
  String? color;
  String? price;

  AnnouncementModel({
    int? id,
    String? name,
    String? description,
    String? image,
    String? marks,
    String? color,
    String? price,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['images'][0]["src"] as String,
    );
  }
}
