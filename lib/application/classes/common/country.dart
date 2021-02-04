class Country {
  final int id;
  final String name;
  final String phoneCode;
  final String countryCode;

  Country.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        phoneCode = json['phoneCode'] ?? '',
        countryCode = json['countryCode'] ?? '';
}
