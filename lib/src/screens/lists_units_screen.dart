// ignore_for_file: prefer_const_constructors

import 'package:alnair/src/models/filter_list_model.dart';
import 'package:alnair/src/widgets/filter_list_bar.dart';
import 'package:flutter/material.dart';
import 'package:alnair/src/widgets/app_bar.dart';
import 'package:alnair/src/widgets/filter_pill.dart';

class UnitListScreen extends StatefulWidget {
  const UnitListScreen({super.key});

  @override
  State<UnitListScreen> createState() => _UnitListScreenState();
}

class _UnitListScreenState extends State<UnitListScreen> {
  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
    );
  }
}
