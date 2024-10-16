import 'package:alnair/src/utils/utilities.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({super.key});

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
              // Blue Container (Image placeholder)
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4 * 0.58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://files.alnair.ae/uploads/logo/2023/5/5c/48/5c48b73ec740a0b53e4807a0210eb31c.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                bottom: 0, // Fix the green container at the bottom
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
                          ? expandedCardInfoBar(context)
                          : collapsedCardInfoBar(context),
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
