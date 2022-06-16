import '../country_repository.dart';
import 'floor_country.dart';
import 'floor_country_dao.dart';
import 'floor_country_database.dart';

class FloorCountryRepository implements CountryRepository<FloorCountry> {
  late FloorCountryDao countryDao;

  @override
  Future<void> init() async {
    final database = await $FloorFloorCountryDatabase
        .databaseBuilder("floor_country.db")
        .build();
    countryDao = database.countryDao;
  }

  @override
  Future<List<FloorCountry>> getAllCountries() {
    return countryDao.getAllCountries();
  }

  @override
  Future<FloorCountry> getCountry(int id) async {
    final country = await countryDao.getCountry(id);
    if(country == null) {
      throw Exception("Invalid Country ID");
    } else {
      return country;
    }
  }

  @override
  Future<void> deleteCountry(FloorCountry country) {
    return countryDao.deleteCountry(country.id ?? -1);
  }

  @override
  Future<void> upsertCountry(FloorCountry country) {
    return countryDao.upsertCountry(country);
  }
}