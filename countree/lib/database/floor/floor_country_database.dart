import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'floor_country.dart';
import 'floor_country_dao.dart';

part 'floor_country_database.g.dart';

@TypeConverters([CountryTypeConverter])
@Database(
  version: 1,
  entities: [
    FloorCountry,
  ],
)
abstract class FloorCountryDatabase extends FloorDatabase {
  FloorCountryDao get countryDao;
}