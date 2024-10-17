class Property {
  final String title;
  final String developer;
  final String primaryPrice;
  final List<Unit> units;
  final String availableUnits;
  final String badge;
  final String imageUrl;

  Property({
    required this.title,
    required this.developer,
    required this.primaryPrice,
    required this.units,
    required this.availableUnits,
    required this.badge,
    required this.imageUrl,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      title: json['title'],
      developer: json['developer'],
      primaryPrice: json['primaryPrice'],
      units: List<Unit>.from(json['units'].map((x) => Unit.fromJson(x))),
      availableUnits: json['availableUnits'],
      badge: json['badge'],
      imageUrl: json['imageUrl'],
    );
  }
}

class Unit {
  final String type;
  final String area;
  final String price;

  Unit({
    required this.type,
    required this.area,
    required this.price,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      type: json['type'],
      area: json['area'],
      price: json['price'],
    );
  }
}
