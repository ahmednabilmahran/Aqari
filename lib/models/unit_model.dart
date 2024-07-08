/// Unit
class UnitModel {
  /// Unit
  UnitModel({
    required this.unitId,
    required this.title,
    required this.description,
    required this.type,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.areaMeter,
    required this.bedrooms,
    required this.bathrooms,
    required this.floor,
    required this.mainImageUrl,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
    required this.isHighlighted,
  });

  /// fromJson
  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      unitId: json['unit_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zip_code'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      price: json['price'] as double,
      areaMeter: json['area_sqft'] as num,
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
      floor: json['floor'] as String,
      mainImageUrl: json['main_image_url'] as String,
      isFeatured: json['is_featured'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isHighlighted: json['is_highlighted'] as bool,
    );
  }

  /// unit_id
  final int unitId;

  /// title
  final String title;

  /// description
  final String description;

  /// type
  final String type;

  /// address
  final String address;

  /// city
  final String city;

  /// state
  final String state;

  /// zip_code
  final String zipCode;

  /// latitude
  final double latitude;

  /// longitude
  final double longitude;

  /// price
  final double price;

  /// areaMeter
  final num areaMeter;

  /// bedrooms
  final int bedrooms;

  /// bathrooms
  final int bathrooms;

  /// floor
  final String floor;

  /// mainImageUrl
  final String mainImageUrl;

  /// isFeatured
  final bool isFeatured;

  /// createdAt
  final DateTime createdAt;

  /// updatedAt
  final DateTime updatedAt;

  /// isHighlighted
  final bool isHighlighted;

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'unit_id': unitId,
      'title': title,
      'description': description,
      'type': type,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'latitude': latitude,
      'longitude': longitude,
      'price': price,
      'area_sqft': areaMeter,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'floor': floor,
      'main_image_url': mainImageUrl,
      'is_featured': isFeatured,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'is_highlighted': isHighlighted,
    };
  }
}
