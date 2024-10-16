// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:alnair/src/configs/cosntants.dart';
import 'package:alnair/src/providers/units_provider.dart';
import 'package:alnair/src/widgets/filter_list_bar.dart';
import 'package:alnair/src/widgets/property_card.dart';
import 'package:alnair/src/widgets/serach_bar.dart';
import 'package:flutter/material.dart';
import 'package:alnair/src/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class UnitListScreen extends StatefulWidget {
  const UnitListScreen({super.key});

  @override
  State<UnitListScreen> createState() => _UnitListScreenState();
}

class _UnitListScreenState extends State<UnitListScreen> {
  @override
  Widget build(BuildContext context) {
    final unitsProvider = Provider.of<UnitsProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: Column(
        children: <Widget>[
          FilterList(),
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          PropertyCard(),
        ],
      ),
    );
  }
}
