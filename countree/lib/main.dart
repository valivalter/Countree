import 'package:flutter/material.dart';
import 'package:mycountries/ui/homepage.dart';
import 'package:mycountries/ui/listpage.dart';
import 'package:provider/provider.dart';

import 'database/data_source.dart';
import 'database/floor/floor_country_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataSource = DataSource(FloorCountryRepository());
  await dataSource.init();

  runApp(
    Provider<DataSource>(
      create: (_) => dataSource,
      child: const CountreeApp(),
    ),
  );
}

class CountreeApp extends StatelessWidget {
  const CountreeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countree',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(title: "Countree"),
      routes: {
        "/listpage": (context) => ListPage(),
      },
    );
  }
}