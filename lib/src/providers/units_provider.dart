import 'package:alnair/src/models/property_model.dart';
import 'package:flutter/material.dart';

class UnitsProvider with ChangeNotifier {
  String _searchedTitle = '';
  List<Property> _properties = [];

  String get searchedTitle => _searchedTitle;

  List<Property> get getProperties => _properties;

  void setSearchedTitle(String title) {
    _searchedTitle = title;
    notifyListeners();
  }

  void setProperties(List<Property> newProperties) {
    _properties = newProperties;
    notifyListeners();
  }

  List<Property> getFilteredProperties() {
    if (_searchedTitle.isEmpty) {
      return _properties; // Return all properties if no search title is set
    }
    return _properties
        .where((property) =>
            property.title.toLowerCase().contains(_searchedTitle.toLowerCase()))
        .toList();
  }

  void fetchPropertiesFromJson(dynamic jsonSource) {
    List<Property> properties = List<Property>.from(
      jsonSource['property'].map((json) => Property.fromJson(json)),
    );
    setProperties(properties); // Update _properties and notify listeners
  }
}
