import 'package:alnair/src/models/property_model.dart';
import 'package:alnair/src/utils/utilities.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatefulWidget {
  final Property property;

  const PropertyCard({required this.property, super.key});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4 * 0.56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        widget.property.imageUrl), // Use the property image
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Details
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: MediaQuery.of(context).size.width,
                    height: _isExpanded
                        ? MediaQuery.of(context).size.height * 0.4 * 0.68
                        : MediaQuery.of(context).size.height * 0.4 * 0.38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 4),
                      child: _isExpanded
                          ? expandedCardInfoBar(context, widget.property)
                          : collapsedCardInfoBar(context, widget.property),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
