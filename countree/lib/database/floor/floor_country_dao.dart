import 'package:floor/floor.dart';

import 'floor_country.dart';

@dao
abstract class FloorCountryDao {
  @Query('SELECT * FROM country')
  Future<List<FloorCountry>> getAllCountries();

  @Query('SELECT * FROM country WHERE id = :id')
  Future<FloorCountry?> getCountry(int id);

  @Query("DELETE FROM country WHERE id = :id")
  Future<void> deleteCountry(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> upsertCountry(FloorCountry country);
}