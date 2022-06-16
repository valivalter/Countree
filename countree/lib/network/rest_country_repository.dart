import 'package:flutter/material.dart';
import '../model/country.dart';
import 'rest_country_service.dart';

class RestCountryRepository {
  var restCountriesService = RestCountriesService();

  Future<Country> getCountry(String cca2) async {
    var response = await restCountriesService.getCountry(cca2);
    return response.countries.map(
          (e) => Country(
              name: Names(common: e.name.common, official: e.name.official),
              tld: e.tld,
              cca2: e.cca2,
              independent: e.independent,
              unMember: e.unMember,
              capital: e.capital,
              region: e.region,
              subregion: e.subregion,
              landlocked: e.landlocked,
              area: e.area,
              population: e.population,
              car: CarInformation(signs: e.car.signs, side: e.car.side),
              timezones: e.timezones,
              continents: e.continents,
              flags: Picture(png: e.flags.png),
              coatOfArms: Picture(png: e.coatOfArms.png),
              startOfWeek: e.startOfWeek
          ),
    ).toList()[0];
  }
}