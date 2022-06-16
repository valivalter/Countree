import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:mycountries/database/data_source.dart';
import 'package:provider/provider.dart';

import '../network/rest_country_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/listpage");
              },
              child: const Text(
                'Where have I been?',
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickCountry,
        tooltip: 'Add new country you have visited',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _pickCountry() {
    final repository = RestCountryRepository();

    showCountryPicker(
      context: context,
      onSelect: (Country country) async {
        var countryModel = await repository.getCountry(country.countryCode);
        context.read<DataSource>().upsertCountry(countryModel);
      },
    );
  }
}
