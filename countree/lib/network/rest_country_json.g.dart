// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_country_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesFindResponse _$CountriesFindResponseFromJson(
        List<dynamic> json) =>
    CountriesFindResponse(
      (json)
          .map((e) => RestCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountriesFindResponseToJson(
        CountriesFindResponse instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };

RestCountry _$RestCountryFromJson(Map<String, dynamic> json) => RestCountry(
      RestCountryNames.fromJson(json['name'] as Map<String, dynamic>),
      (json['tld'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['cca2'] as String,
      json['independent'] as bool?,
      json['unMember'] as bool?,
      (json['capital'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['region'] as String?,
      json['subregion'] as String?,
      json['landlocked'] as bool?,
      (json['area'] as num).toDouble(),
      json['population'] as int,
      RestCountryCarInformation.fromJson(json['car'] as Map<String, dynamic>),
      (json['timezones'] as List<dynamic>).map((e) => e as String).toList(),
      (json['continents'] as List<dynamic>).map((e) => e as String).toList(),
      RestCountryPicture.fromJson(json['flags'] as Map<String, dynamic>),
      RestCountryPicture.fromJson(json['coatOfArms'] as Map<String, dynamic>),
      json['startOfWeek'] as String?,
    );

Map<String, dynamic> _$RestCountryToJson(RestCountry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tld': instance.tld,
      'cca2': instance.cca2,
      'independent': instance.independent,
      'unMember': instance.unMember,
      'capital': instance.capital,
      'region': instance.region,
      'subregion': instance.subregion,
      'landlocked': instance.landlocked,
      'area': instance.area,
      'population': instance.population,
      'car': instance.car,
      'timezones': instance.timezones,
      'continents': instance.continents,
      'flags': instance.flags,
      'coatOfArms': instance.coatOfArms,
      'startOfWeek': instance.startOfWeek,
    };

RestCountryNames _$RestCountryNamesFromJson(Map<String, dynamic> json) =>
    RestCountryNames(
      json['common'] as String,
      json['official'] as String,
    );

Map<String, dynamic> _$RestCountryNamesToJson(RestCountryNames instance) =>
    <String, dynamic>{
      'common': instance.common,
      'official': instance.official,
    };

RestCountryCarInformation _$RestCountryCarInformationFromJson(
        Map<String, dynamic> json) =>
    RestCountryCarInformation(
      (json['signs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['side'] as String?,
    );

Map<String, dynamic> _$RestCountryCarInformationToJson(
        RestCountryCarInformation instance) =>
    <String, dynamic>{
      'signs': instance.signs,
      'side': instance.side,
    };

RestCountryPicture _$RestCountryPictureFromJson(Map<String, dynamic> json) =>
    RestCountryPicture(
      json['png'] as String?,
    );

Map<String, dynamic> _$RestCountryPictureToJson(RestCountryPicture instance) =>
    <String, dynamic>{
      'png': instance.png,
    };
