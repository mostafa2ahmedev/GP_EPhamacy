class SupplierModel {
  final int id;
  final String name;

  SupplierModel({required this.id, required this.name});
  factory SupplierModel.fromjson({required Map<String, dynamic> json}) {
    return SupplierModel(id: json['id'], name: json['name']);
  }
}
