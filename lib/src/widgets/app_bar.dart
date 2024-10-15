// ignore_for_file: override_on_non_overriding_member

import 'package:alnair/src/configs/cosntants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: AppBar(
            shadowColor: Colors.black,
            title: const Center(child: Text(APP_NAME)),
            leading:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[400],
        ),
      ],
    );
  }
}
