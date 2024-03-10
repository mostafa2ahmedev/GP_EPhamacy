class DiseaseModel {
  final int id;
  final String name;

  DiseaseModel({required this.id, required this.name});

  factory DiseaseModel.fromJson(json) {
    return DiseaseModel(id: json['id'], name: json['name']);
  }
}
