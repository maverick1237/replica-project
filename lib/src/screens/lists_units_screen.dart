import 'package:alnair/src/models/property_data.dart';
import 'package:alnair/src/models/property_model.dart';
import 'package:alnair/src/providers/units_provider.dart';
import 'package:alnair/src/widgets/app_bar.dart';
import 'package:alnair/src/widgets/filter_list_bar.dart';
import 'package:alnair/src/widgets/property_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnitListScreen extends StatefulWidget {
  const UnitListScreen({super.key});

  @override
  State<UnitListScreen> createState() => _UnitListScreenState();
}

class _UnitListScreenState extends State<UnitListScreen> {
  late List<Property> propertiesData;

  @override
  void initState() {
    super.initState();
    propertiesData = [];
  }

  @override
  Widget build(BuildContext context) {
    final unitsProvider = Provider.of<UnitsProvider>(context);
    unitsProvider.fetchPropertiesFromJson(properties_data);
    propertiesData = unitsProvider.getProperties;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Theme(
          data: Theme.of(context).copyWith(
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white)), // Set your desired color
          child: const CustomAppBar(),
        ),
      ),
      body: Column(
        children: <Widget>[
          const FilterList(),
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: propertiesData.length,
              itemBuilder: (context, index) {
                return PropertyCard(
                  property: propertiesData[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
