import 'package:flutter/cupertino.dart';

class Country {
  final String _name;
  final String _iso2;
  final String _iso3;

  String get name => _name;

  String get iso2 => _iso2;

  String get iso3 => _iso3;

  Country(@required this._name, @required this._iso2, @required this._iso3);

  factory Country.fromJson(Map<String, dynamic> parsedJson) {
    return Country(parsedJson['name'], parsedJson['iso2'], parsedJson['iso3']);
  }
}
