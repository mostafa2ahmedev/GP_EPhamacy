class UnitModel {
  int id;
  int type;
  String name;

  UnitModel({required this.id, required this.type, required this.name});

  factory UnitModel.fromjson({required Map<String, dynamic> json}) {
    return UnitModel(id: json['id'], type: json['type'], name: json['name']);
  }
}
