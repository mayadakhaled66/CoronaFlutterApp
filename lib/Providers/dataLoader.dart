import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../country.dart';

class DataLoader extends ChangeNotifier {
  // the list that will be filled by the api
  List<Country> _coronaDataList = [];

  /**
   * this is for making any widget that will consume this list can take only copy of the list
   * so the widget can't edit directly in the orginal list in the provider so it can compare and notify
   * any change happen to the other widgets to rerender the new change
   */
  get coronaDataList => [..._coronaDataList];

  Future<void> getMyCountriesList() async {
    final url = "https://covid19.mathdro.id/api";
//    final url = "https://covid19.mathdro.id/api/countries";

    try {
      // the await is for waiting the response and not pass it if there is any delay
      final response = await http.get(url);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      final List<Country> loadedOrders = [];
//      print(responseData['countries'][52]);
      responseData.forEach((prodId, countryData) {
        loadedOrders.add(Country(
          countryData['name'],
          countryData['ios2'],
          countryData['ios3'],
        ));
      });
      _coronaDataList = loadedOrders;
      print("iteeeeeeem : ${_coronaDataList[0]}");

      notifyListeners();
    } catch (error) {}
  }
}
