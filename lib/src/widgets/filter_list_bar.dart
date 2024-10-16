import 'package:alnair/src/models/filter_list_model.dart';
import 'package:alnair/src/widgets/filter_pill.dart';
import 'package:flutter/material.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key});

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  Map<String, String?> selectedValues = {
    'propertyValue': null,
    'priceValue': null,
    'bedrooms': null,
    'Sales status': null
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.entries.map((filter) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: FilterPill(
              title: filter.value['title'],
              listOptions: List<String>.from(filter.value['listOptions']),
              selectedOption: selectedValues[filter.key],
              onChanged: (String? value) {
                setState(() {
                  selectedValues[filter.key] = value;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
