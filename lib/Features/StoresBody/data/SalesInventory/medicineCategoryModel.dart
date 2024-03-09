class MediniceCategory {
  final int id;
  final String name;

  MediniceCategory({required this.id, required this.name});

  factory MediniceCategory.fromjson({required Map<String, dynamic> json}) {
    return MediniceCategory(id: json['id'], name: json['name']);
  }
}
