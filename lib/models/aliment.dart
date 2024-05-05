class Aliment {
  final int id;
  final String name;
  final double quantity;
  final double calories;
  final double glucides;
  final double proteins;
  final double fats;

  factory Aliment.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final int id = properties['id'];
    final String name = properties['name'];
    final double quantity = properties['quantity'];
    final double calories = properties['calories'];
    final double glucides = properties['glucides'];
    final double proteins = properties['proteins'];
    final double fats = properties['fats'];

    return Aliment(
      id: id,
      name: name,
      quantity: quantity,
      calories: calories,
      glucides: glucides,
      proteins: proteins,
      fats: fats,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'calories': calories,
      'glucides': glucides,
      'proteins': proteins,
      'fats': fats,
    };
  }

  factory Aliment.fromJson(Map<String, dynamic> json) {
    return Aliment(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'] ?? 0,
      calories: json['calories'] ?? 0,
      glucides: json['glucides'] ?? 0,
      proteins: json['proteins'] ?? 0,
      fats: json['fats'] ?? 0,
    );
  }

  Aliment({
    required this.id,
    required this.name,
    required this.quantity,
    required this.calories,
    required this.glucides,
    required this.proteins,
    required this.fats,
  });
}
