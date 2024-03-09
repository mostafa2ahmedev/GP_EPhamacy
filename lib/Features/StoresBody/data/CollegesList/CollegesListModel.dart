class CollegesListModel {
  final String collegeName;
  final int count;

  CollegesListModel({required this.collegeName, required this.count});

  factory CollegesListModel.fromJson({required Map<String, dynamic> json}) {
    return CollegesListModel(
        collegeName: json['collegeName'], count: json['count']);
  }
}
