class CarAnnouncementModel {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  String? categories;
  String? price;

  CarAnnouncementModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.categories,
    this.price,
  });

  factory CarAnnouncementModel.fromJson(Map<String, dynamic> json) {
    return CarAnnouncementModel(
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
      // categories: json['categories'][0]["id"] as String,
    );
  }
}
