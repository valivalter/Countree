import 'package:floor/floor.dart';

@Entity(tableName: "country")
class FloorCountry {
  @PrimaryKey(autoGenerate: true)
  int? id;
  List<String> name;
  List<String> tld;
  String cca2;
  String independent;
  String unMember;
  List<String> capital;
  String region;
  String subregion;
  String landlocked;
  double area;
  int population;
  List<String> carSigns;
  String carSide;
  List<String> timezones;
  List<String> continents;
  String flags;
  String coatOfArms;
  String startOfWeek;

  FloorCountry({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.independent,
    required this.unMember,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.landlocked,
    required this.area,
    required this.population,
    required this.carSigns,
    required this.carSide,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
  });
}

class CountryTypeConverter extends TypeConverter<List<String>, String> {

  @override
  List<String> decode(String string) {
    return string.split(';');
  }

  @override
  String encode(List<String> list) {
    var concat = "";
    for (String string in list) {
      concat += "$string;";
    }
    return concat.substring(0, concat.length-1);
  }
}