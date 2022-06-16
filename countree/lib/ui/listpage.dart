import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/data_source.dart';
import '../model/country.dart';
import 'detailspage.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  late final dataSource;

  Future<List<Country>>? listRequest;

  @override
  void initState() {
    dataSource = context.read<DataSource>();
    listRequest = dataSource.getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your countries"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: CountrySearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          var request = dataSource.getCountries();
          setState(() {
            listRequest = request;
          });
          await request;
        },
        child: FutureBuilder<List<Country>>(
            future: listRequest,
            builder: (context, snapshot) {
              if (snapshot.hasError){
                return Center(
                  child: Text(
                      "Error: ${snapshot.error}"
                  ),
                );
              } else if (snapshot.hasData){
                var list = snapshot.data!;
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, i){
                    return ListItem(list[i]);
                  },
                  itemCount: list.length,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Country country;

  const ListItem(this.country, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ListTile(
          leading: Hero(
            tag: country.cca2,
            child: Image.network(
              "${country.flags.png}",
              fit: BoxFit.cover,
            ),
          ),
          title: Text(country.name.common),
          subtitle: Text(
            country.capital?[0] ?? "",
            maxLines: 1,
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DetailsPage(country)));
          },
        ),
      ),
    );
  }
}

class CountrySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Country>>(
        future: context.read<DataSource>().getCountries(query),
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return Center(
              child: Text(
                  "Error: ${snapshot.error}"
              ),
            );
          } else if (snapshot.hasData){
            var list = snapshot.data!;
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i){
                return ListItem(list[i]);
              },
              itemCount: list.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Country>>(
        future: context.read<DataSource>().getCountries(query),
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return Center(
              child: Text(
                  "Error: ${snapshot.error}"
              ),
            );
          } else if (snapshot.hasData){
            var list = snapshot.data!;
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i){
                return ListItem(list[i]);
              },
              itemCount: list.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }
}