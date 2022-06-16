import '../model/country.dart';
import 'country_repository.dart';
import 'floor/floor_country.dart';

class DataSource {
  final CountryRepository<FloorCountry> database;

  DataSource(this.database);

  Future<void> init() async {
    await database.init();
  }

  Future<List<Country>> getCountries([String search = ""]) async {
    final dbCountries = await database.getAllCountries();
    var countries = dbCountries.map((floorCountry) => floorCountry.toDomainModel()).toList();
    if (search == "") {
      return countries;
    }
    else {
      var suitableCountries = <Country>[];
      for (var country in countries) {
        if (country.name.common.toLowerCase().contains(search.toLowerCase())) {
          suitableCountries.add(country);
        }
      }
      return suitableCountries;
    }
  }

  Future<Country> getCountry(int id) async {
    final floorCountry = await database.getCountry(id);
    return floorCountry.toDomainModel();
  }

  Future<void> upsertCountry(Country country) async {
    var countries = await getCountries();
    var add = true;
    for (var element in countries) {
      if (country.cca2 == element.cca2) {
        add = false;
      }
    }
    if (add) {
      return database.upsertCountry(country.toDbModel());
    }
  }

  Future<void> deleteCountry(Country country) async {
    return database.deleteCountry(country.toDbModel());
  }
}

extension CountryToFloorCountry on Country {
  FloorCountry toDbModel() {
    return FloorCountry(
        name: List.of([name.common, name.official]),
        tld: tld ?? List.empty(),
        cca2: cca2,
        independent: independent.toString(),
        unMember: unMember.toString(),
        capital: capital ?? List.empty(),
        region: region ?? "",
        subregion: subregion ?? "",
        landlocked: landlocked.toString(),
        area: area,
        population: population,
        carSigns: car.signs ?? List.empty(),
        carSide: car.side ?? "",
        timezones: timezones,
        continents: continents,
        flags: flags.png ?? "",
        coatOfArms: coatOfArms.png ?? "",
        startOfWeek: startOfWeek ?? ""
    );
  }
}

extension FloorCountryToCountry on FloorCountry {
  Country toDomainModel() {
    bool? indep;
    if (independent == "true") {
      indep = true;
    }
    else if (independent == "false") {
      indep = false;
    }

    bool? un;
    if (unMember == "true") {
      un = true;
    }
    else if (unMember == "false") {
      un = false;
    }

    bool? land;
    if (landlocked == "true") {
      land = true;
    }
    else if (landlocked == "false") {
      land = false;
    }

    return Country(
        name: Names(common: name[0], official: name[1]),
        tld: tld,
        cca2: cca2,
        independent: indep,
        unMember: un,
        capital: capital,
        region: region,
        subregion: subregion,
        landlocked: land,
        area: area,
        population: population,
        car: CarInformation(signs: carSigns, side: carSide),
        timezones: timezones,
        continents: continents,
        flags: Picture(png: flags),
        coatOfArms: Picture(png: coatOfArms),
        startOfWeek: startOfWeek
    );
  }
}