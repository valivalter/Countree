// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_country_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFloorCountryDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorCountryDatabaseBuilder databaseBuilder(String name) =>
      _$FloorCountryDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorCountryDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FloorCountryDatabaseBuilder(null);
}

class _$FloorCountryDatabaseBuilder {
  _$FloorCountryDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorCountryDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorCountryDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FloorCountryDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorCountryDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorCountryDatabase extends FloorCountryDatabase {
  _$FloorCountryDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FloorCountryDao? _countryDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `country` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `tld` TEXT NOT NULL, `cca2` TEXT NOT NULL, `independent` TEXT NOT NULL, `unMember` TEXT NOT NULL, `capital` TEXT NOT NULL, `region` TEXT NOT NULL, `subregion` TEXT NOT NULL, `landlocked` TEXT NOT NULL, `area` REAL NOT NULL, `population` INTEGER NOT NULL, `carSigns` TEXT NOT NULL, `carSide` TEXT NOT NULL, `timezones` TEXT NOT NULL, `continents` TEXT NOT NULL, `flags` TEXT NOT NULL, `coatOfArms` TEXT NOT NULL, `startOfWeek` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FloorCountryDao get countryDao {
    return _countryDaoInstance ??= _$FloorCountryDao(database, changeListener);
  }
}

class _$FloorCountryDao extends FloorCountryDao {
  _$FloorCountryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _floorCountryInsertionAdapter = InsertionAdapter(
            database,
            'country',
            (FloorCountry item) => <String, Object?>{
                  'id': item.id,
                  'name': _countryTypeConverter.encode(item.name),
                  'tld': _countryTypeConverter.encode(item.tld),
                  'cca2': item.cca2,
                  'independent': item.independent,
                  'unMember': item.unMember,
                  'capital': _countryTypeConverter.encode(item.capital),
                  'region': item.region,
                  'subregion': item.subregion,
                  'landlocked': item.landlocked,
                  'area': item.area,
                  'population': item.population,
                  'carSigns': _countryTypeConverter.encode(item.carSigns),
                  'carSide': item.carSide,
                  'timezones': _countryTypeConverter.encode(item.timezones),
                  'continents': _countryTypeConverter.encode(item.continents),
                  'flags': item.flags,
                  'coatOfArms': item.coatOfArms,
                  'startOfWeek': item.startOfWeek
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorCountry> _floorCountryInsertionAdapter;

  @override
  Future<List<FloorCountry>> getAllCountries() async {
    return _queryAdapter.queryList('SELECT * FROM country',
        mapper: (Map<String, Object?> row) => FloorCountry(
            name: _countryTypeConverter.decode(row['name'] as String),
            tld: _countryTypeConverter.decode(row['tld'] as String),
            cca2: row['cca2'] as String,
            independent: row['independent'] as String,
            unMember: row['unMember'] as String,
            capital: _countryTypeConverter.decode(row['capital'] as String),
            region: row['region'] as String,
            subregion: row['subregion'] as String,
            landlocked: row['landlocked'] as String,
            area: row['area'] as double,
            population: row['population'] as int,
            carSigns: _countryTypeConverter.decode(row['carSigns'] as String),
            carSide: row['carSide'] as String,
            timezones: _countryTypeConverter.decode(row['timezones'] as String),
            continents:
                _countryTypeConverter.decode(row['continents'] as String),
            flags: row['flags'] as String,
            coatOfArms: row['coatOfArms'] as String,
            startOfWeek: row['startOfWeek'] as String));
  }

  @override
  Future<FloorCountry?> getCountry(int id) async {
    return _queryAdapter.query('SELECT * FROM country WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FloorCountry(
            name: _countryTypeConverter.decode(row['name'] as String),
            tld: _countryTypeConverter.decode(row['tld'] as String),
            cca2: row['cca2'] as String,
            independent: row['independent'] as String,
            unMember: row['unMember'] as String,
            capital: _countryTypeConverter.decode(row['capital'] as String),
            region: row['region'] as String,
            subregion: row['subregion'] as String,
            landlocked: row['landlocked'] as String,
            area: row['area'] as double,
            population: row['population'] as int,
            carSigns: _countryTypeConverter.decode(row['carSigns'] as String),
            carSide: row['carSide'] as String,
            timezones: _countryTypeConverter.decode(row['timezones'] as String),
            continents:
                _countryTypeConverter.decode(row['continents'] as String),
            flags: row['flags'] as String,
            coatOfArms: row['coatOfArms'] as String,
            startOfWeek: row['startOfWeek'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteCountry(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM country WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> upsertCountry(FloorCountry country) async {
    await _floorCountryInsertionAdapter.insert(
        country, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _countryTypeConverter = CountryTypeConverter();
