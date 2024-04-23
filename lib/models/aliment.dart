class Aliment {
  final int id;
  final String name;

  factory Aliment.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final int id = properties['id'];
    final String name = properties['name'];

    return Aliment(
      id: id,
      name: name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Aliment.fromJson(Map<String, dynamic> json) {
    return Aliment(id: json['id'], name: json['name']);
  }

  Aliment({
    required this.id,
    required this.name,
  });
}
