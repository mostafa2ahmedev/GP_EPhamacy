import 'package:gppharmacy/Features/StoresBody/data/DispensingMedications/InventoryModel.dart';

class UsageColleges {
  int? id;
  String? date;
  String? collegeName;
  List<CollegeUseageMedicines>? collegeUseageMedicines;
  int? totalPrice;

  UsageColleges(
      {this.id,
      this.date,
      this.collegeName,
      this.collegeUseageMedicines,
      this.totalPrice});

  UsageColleges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    collegeName = json['collegeName'];
    if (json['collegeUseageMedicines'] != null) {
      collegeUseageMedicines = <CollegeUseageMedicines>[];
      json['collegeUseageMedicines'].forEach((v) {
        collegeUseageMedicines!.add(new CollegeUseageMedicines.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['collegeName'] = this.collegeName;
    if (this.collegeUseageMedicines != null) {
      data['collegeUseageMedicines'] =
          this.collegeUseageMedicines!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

class CollegeUseageMedicines {
  int? id;
  int? amount;
  InventoryModel? inventory;

  CollegeUseageMedicines({this.id, this.amount, this.inventory});

  CollegeUseageMedicines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    inventory = json['inventory'] != null
        ? new InventoryModel.fromJson(json: json['inventory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['amount'] = amount;
    if (inventory != null) {
      data['inventory'] = inventory!.toJson();
    }
    return data;
  }
}
