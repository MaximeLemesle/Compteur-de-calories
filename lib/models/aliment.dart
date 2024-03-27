class Aliment {
  final String name;

  factory Aliment.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final String name = properties['name'];

    return Aliment(name: name,);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  factory Aliment.fromJson(Map<String, dynamic> json) {
    return Aliment(name: json['name']);
  }

  Aliment({
    required this.name,
  });}
