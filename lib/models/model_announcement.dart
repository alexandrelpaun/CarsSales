class AnnouncementModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  String? categories;
  String? price;

  AnnouncementModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.categories,
    this.price,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      // imageUrl: json['images'][0]["src"] as String,
      imageUrl: json['images'] != null
          ? ((json['images'] as List).isNotEmpty
              ? json['images'][0]["src"]
              : null)
          : null,
      price: json['price'] as String,
      // categories: json['categories'][2]["cars"] as String,
    );
  }
}
