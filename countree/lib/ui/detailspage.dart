import 'package:flutter/material.dart';

import '../model/country.dart';

class DetailsPage extends StatefulWidget {
  final Country country;

  const DetailsPage(this.country, {Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  _DetailsPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(widget.country.name.common),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Text(
                        widget.country.name.common,
                        style: const TextStyle(
                            fontSize: 30,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: ListTile(
                      leading: Hero(
                        tag: widget.country.cca2,
                        child: Image.network(
                          "${widget.country.flags.png}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      trailing: Image.network(
                        "${widget.country.coatOfArms.png}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                DataRow(
                  rowTitle: "Official name",
                  rowData: widget.country.name.official,
                ),
                DataRow.fromList(
                  rowTitle: "Capital",
                  rowMultipleData: widget.country.capital,
                ),
                DataRow(
                  rowTitle: "Population",
                  rowData: widget.country.population.toString(),
                ),
                DataRow(
                  rowTitle: "Area",
                  rowData: widget.country.area.toInt().toString() + " km²",
                ),
                DataRow(
                  rowTitle: "Region",
                  rowData: widget.country.region.toString(),
                ),
                DataRow(
                  rowTitle: "Subregion",
                  rowData: widget.country.subregion.toString(),
                ),
                DataRow.fromList(
                  rowTitle: "TLD",
                  rowMultipleData: widget.country.tld,
                ),
                DataRow(
                  rowTitle: "Independent",
                  rowData: widget.country.independent.toString(),
                ),
                DataRow(
                  rowTitle: "UN member",
                  rowData: widget.country.unMember.toString(),
                ),
                DataRow.fromList(
                  rowTitle: "Continents",
                  rowMultipleData: widget.country.continents,
                ),
                DataRow.fromList(
                  rowTitle: "Timezones",
                  rowMultipleData: widget.country.timezones,
                ),
                DataRow(
                  rowTitle: "Landlocked",
                  rowData: widget.country.landlocked.toString(),
                ),
                DataRow(
                  rowTitle: "Start of week",
                  rowData: widget.country.startOfWeek.toString(),
                ),
                DataRow.fromList(
                  rowTitle: "Car sign",
                  rowMultipleData: widget.country.car.signs,
                ),
                DataRow(
                  rowTitle: "Traffic side",
                  rowData: widget.country.car.side.toString(),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}

class DataRow extends StatelessWidget {
  final String rowTitle;
  late String rowData;

  DataRow({
    Key? key,
    required this.rowTitle,
    required this.rowData,
  }) : super(key: key);

  DataRow.fromList({
    Key? key,
    required this.rowTitle,
    required List<String>? rowMultipleData,
  }) : super(key: key) {
    var row = "";
    if (rowMultipleData != null) {
      for (var string in rowMultipleData) {
        row += "$string, ";
      }
    }
    rowData = row.substring(0, row.length - 2);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ListTile(
          title: Text(rowTitle),
          subtitle: Text(
            rowData,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}