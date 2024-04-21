/// AqariCountryModel
class AqariCountryModel {
  /// Constructor
  AqariCountryModel({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.flag,
    required this.minPhoneLength,
    required this.maxPhoneLength,
  });

  /// From json
  factory AqariCountryModel.fromJson(Map<String, dynamic> json) {
    return AqariCountryModel(
      name: json['name'] as String,
      code: json['code'] as String,
      dialCode: json['dialCode'] as String,
      flag: json['flag'] as String,
      minPhoneLength: json['minPhoneLength'] as int,
      maxPhoneLength: json['maxPhoneLength'] as int,
    );
  }

  /// Name
  final String name;

  /// Code
  final String code;

  /// dialCode
  final String dialCode;

  /// Flag
  final String flag;

  /// Min phone length
  final int minPhoneLength;

  /// Max phone length
  final int maxPhoneLength;
}
