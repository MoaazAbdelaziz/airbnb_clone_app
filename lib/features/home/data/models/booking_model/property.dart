class Property {
  int? id;
  int? userId;
  String? name;
  String? description;
  String? price;
  String? location;
  String? images;
  String? video;
  DateTime? createdAt;
  DateTime? updatedAt;

  Property({
    this.id,
    this.userId,
    this.name,
    this.description,
    this.price,
    this.location,
    this.images,
    this.video,
    this.createdAt,
    this.updatedAt,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        location: json['location'] as String?,
        images: json['images'] as String?,
        video: json['video'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'name': name,
        'description': description,
        'price': price,
        'location': location,
        'images': images,
        'video': video,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
