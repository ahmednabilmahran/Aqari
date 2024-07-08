/// UnitImage model class
class UnitImageModel {
  /// Constructor
  UnitImageModel({
    required this.imageId,
    required this.unitId,
    required this.imageUrl,
    required this.createdAt,
  });

  /// fromJson
  factory UnitImageModel.fromJson(Map<String, dynamic> json) {
    return UnitImageModel(
      imageId: json['image_id'] as int,
      unitId: json['unit_id'] as int,
      imageUrl: json['image_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// Image id
  final int imageId;

  /// Unit id
  final int unitId;

  /// Image URL
  final String imageUrl;

  /// Created at
  final DateTime createdAt;

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'image_id': imageId,
      'unit_id': unitId,
      'image_url': imageUrl,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
