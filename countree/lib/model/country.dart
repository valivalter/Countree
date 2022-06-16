class Country {
  final Names name;
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
  final CarInformation car;
  final List<String> timezones;
  final List<String> continents;
  final Picture flags;
  final Picture coatOfArms;
  final String? startOfWeek;

  const Country({
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
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
  });
}

class Names {
  final String common;
  final String official;

  const Names({
    required this.common,
    required this.official,
  });
}

class CarInformation {
  final List<String>? signs;
  final String? side;

  const CarInformation({
    required this.signs,
    required this.side,
  });
}

class Picture {
  final String? png;

  const Picture({
    required this.png,
  });
}
