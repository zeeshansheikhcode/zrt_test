
class CountryModel 
{
  final String countryName;
  final String region;
  final String flag;

  CountryModel({
    required this.countryName, 
    required this.region,
    required this.flag
  });
   Map<String, dynamic> toMap() {
    return {
      'countryName': countryName,
      'region': region,
      'flag': flag,
    };
  }

  // Create a CountryModel object from a Map
  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      countryName: map['countryName'] as String,
      region: map['region'] as String,
      flag: map['flag'] as String,
    );
  }
}