abstract class CountryRepository<T> {
  Future<void> init();

  Future<List<T>> getAllCountries();

  Future<T> getCountry(int id);

  Future<void> upsertCountry(T country);

  Future<void> deleteCountry(T country);
}