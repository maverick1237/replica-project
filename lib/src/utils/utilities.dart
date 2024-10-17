// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alnair/src/models/property_model.dart';
import 'package:alnair/src/widgets/property_info_expansion.dart';
import 'package:flutter/material.dart';

//Bottom Filter Drawer
void openBottomFilterSheet(
    BuildContext context, title, listOptions, onChanged) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      listOptions[index],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      onChanged(listOptions[index]);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

// Usage in the collapsed version
Widget collapsedCardInfoBar(BuildContext context, Property property) {
  return PropertyCardInfo(
    property: property,
    imageSize: MediaQuery.of(context).size.height * 0.4 * 0.38 * 0.44,
    isExpanded: false,
  );
}

// Usage in the expanded version
Widget expandedCardInfoBar(BuildContext context, Property property) {
  return PropertyCardInfo(
    property: property,
    imageSize: MediaQuery.of(context).size.height * 0.4 * 0.38 * 0.44,
    isExpanded: true,
  );
}
