class PartAnnouncementModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;

  String? price;

  PartAnnouncementModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
  });

  factory PartAnnouncementModel.fromJson(Map<String, dynamic> json) {
    return PartAnnouncementModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['images'] != null
          ? ((json['images'] as List).isNotEmpty
              ? json['images'][0]["src"]
              : null)
          : null,
      price: json['price'] as String,
    );
  }
}
