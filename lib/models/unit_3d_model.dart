/// Unit3DModel class
class Unit3DModel {
  /// Constructor
  Unit3DModel({
    required this.modelId,
    required this.unitId,
    required this.modelUrl,
    required this.createdAt,
  });

  /// fromJson
  factory Unit3DModel.fromJson(Map<String, dynamic> json) {
    return Unit3DModel(
      modelId: json['model_id'] as int,
      unitId: json['unit_id'] as int,
      modelUrl: json['model_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// model_id
  final int modelId;

  /// unit_id
  final int unitId;

  /// model_url
  final String modelUrl;

  /// created_at
  final DateTime createdAt;

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'model_id': modelId,
      'unit_id': unitId,
      'model_url': modelUrl,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
