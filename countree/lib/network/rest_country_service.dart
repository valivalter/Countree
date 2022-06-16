import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mycountries/network/rest_country_json.dart';

const _baseUrl = "restcountries.com";

CountriesFindResponse _parseCountriesFindResponse(String message) {
  return CountriesFindResponse.fromJson(jsonDecode(message));
}

class RestCountriesService {
  Future<CountriesFindResponse> getCountry(String cca2) async {
    var response = await http.get(
      Uri.https(_baseUrl, "v3.1/alpha/$cca2")
    );
    return compute(_parseCountriesFindResponse, response.body);
  }
}