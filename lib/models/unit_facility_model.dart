/// UnitFacility model class
class UnitFacilityModel {
  /// Constructor
  UnitFacilityModel({
    required this.unitFacilityId,
    required this.unitId,
    required this.facilityId,
    required this.isEnabled,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// fromJson
  factory UnitFacilityModel.fromJson(Map<String, dynamic> json) {
    return UnitFacilityModel(
      unitFacilityId: json['unit_facility_id'] as int,
      unitId: json['unit_id'] as int,
      facilityId: json['facility_id'] as int,
      isEnabled: json['is_enabled'] as bool,
      userId: json['user_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  /// Unit facility id
  final int unitFacilityId;

  /// Unit id
  final int unitId;

  /// Facility id
  final int facilityId;

  /// Is enabled
  final bool isEnabled;

  /// User id
  final String userId;

  /// Created at
  final DateTime createdAt;

  /// Updated at
  final DateTime updatedAt;

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'unit_facility_id': unitFacilityId,
      'unit_id': unitId,
      'facility_id': facilityId,
      'is_enabled': isEnabled,
      'user_id': userId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
