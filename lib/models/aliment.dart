class Aliment {
  final int id;
  final String name;
  final String image;

  factory Aliment.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final int id = properties['id'];
    final String name = properties['name'];
    final String image = properties['image'];

    return Aliment(id: id, name: name, image: image);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Aliment.fromJson(Map<String, dynamic> json) {
    return Aliment(id: json['id'], name: json['name'], image: json['image']);
  }

  Aliment({
    required this.id,
    required this.name,
    required this.image,
  });}
