class PrsPrescriptionCategory {
  final int id;
  final String name;

  PrsPrescriptionCategory({required this.id, required this.name});

  factory PrsPrescriptionCategory.fromJson(
      {required Map<String, dynamic> json}) {
    return PrsPrescriptionCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}
