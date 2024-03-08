class SalesInventoryModel {
  final String name;
  final String barcode;
  final String amount;
  // final String? strength;

  SalesInventoryModel({
    required this.name,
    required this.barcode,
    required this.amount,
    // this.strength
  });

  factory SalesInventoryModel.fromJson({Map<String, dynamic>? json}) {
    return SalesInventoryModel(
      name: json!['name'],
      barcode: json['barcode'],
      amount: json['amount'],
    );
  }
}
