import 'package:alnair/src/models/property_model.dart';
import 'package:flutter/material.dart';

class PropertyCardInfo extends StatelessWidget {
  final Property property;
  final double imageSize;
  final bool isExpanded;

  const PropertyCardInfo({
    super.key,
    required this.property,
    required this.imageSize,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://cdn2.hubspot.net/hubfs/53/image8-2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  property.developer,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        lineBreak(context),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Primary',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'from ${property.primaryPrice}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: isExpanded
                  ? const Icon(
                      Icons.arrow_downward,
                      color: Colors.black38,
                      size: 16,
                    )
                  : const Icon(
                      Icons.arrow_upward,
                      color: Colors.black38,
                      size: 16,
                    ),
            ),
          ],
        ),
        if (isExpanded)
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              lineBreak(context),
              const SizedBox(height: 2),
              Expanded(
                flex: 4,
                child: ListView.builder(
                  itemCount: property.units.length,
                  itemBuilder: (context, index) {
                    final unit = property.units[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          unit.type,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${unit.area} sq.ft',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          '\$${unit.price}',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    property.availableUnits,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ))
      ],
    );
  }
}

// line Break Widget
Widget lineBreak(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 1,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
