class Aliment {
  final int id;
  final String name;

  factory Aliment.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final int id = properties['id'];
    final String name = properties['name'];

    return Aliment(id, name);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Aliment.fromJson(Map<String, dynamic> json) {
    return Aliment(json['id'], json['name']);
  }

  const Aliment(this.id, this.name);
}
