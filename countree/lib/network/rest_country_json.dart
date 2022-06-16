import 'package:json_annotation/json_annotation.dart';

part 'rest_country_json.g.dart';

@JsonSerializable()
class CountriesFindResponse{
  final List<RestCountry> countries;

  CountriesFindResponse(this.countries);

  factory CountriesFindResponse.fromJson(List<dynamic> json) => _$CountriesFindResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CountriesFindResponseToJson(this);
}

@JsonSerializable()
class RestCountry {
  final RestCountryNames name;
  final List<String>? tld;
  final String cca2;
  final bool? independent;
  final bool? unMember;
  final List<String>? capital;
  final String? region;
  final String? subregion;
  final bool? landlocked;
  final double area;
  final int population;
  final RestCountryCarInformation car;
  final List<String> timezones;
  final List<String> continents;
  final RestCountryPicture flags;
  final RestCountryPicture coatOfArms;
  final String? startOfWeek;

  RestCountry(this.name, this.tld, this.cca2, this.independent, this.unMember,
      this.capital, this.region, this.subregion, this.landlocked, this.area, this.population,
      this.car, this.timezones, this.continents, this.flags, this.coatOfArms, this.startOfWeek,
  );

  factory RestCountry.fromJson(Map<String, dynamic> json) => _$RestCountryFromJson(json);
  Map<String, dynamic> toJson() => _$RestCountryToJson(this);
}

@JsonSerializable()
class RestCountryNames {
  final String common;
  final String official;

  RestCountryNames(this.common, this.official);

  factory RestCountryNames.fromJson(Map<String, dynamic> json) => _$RestCountryNamesFromJson(json);
  Map<String, dynamic> toJson() => _$RestCountryNamesToJson(this);
}

@JsonSerializable()
class RestCountryCarInformation {
  final List<String>? signs;
  final String? side;

  RestCountryCarInformation(this.signs, this.side);

  factory RestCountryCarInformation.fromJson(Map<String, dynamic> json) => _$RestCountryCarInformationFromJson(json);
  Map<String, dynamic> toJson() => _$RestCountryCarInformationToJson(this);
}

@JsonSerializable()
class RestCountryPicture {
  final String? png;

  RestCountryPicture(this.png);

  factory RestCountryPicture.fromJson(Map<String, dynamic> json) => _$RestCountryPictureFromJson(json);
  Map<String, dynamic> toJson() => _$RestCountryPictureToJson(this);
}