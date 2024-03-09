import 'package:flutter/material.dart';
import 'package:gppharmacy/Features/StoresBody/data/CollegesList/CollegesListModel.dart';

class ListTileForCollegesList extends StatelessWidget {
  const ListTileForCollegesList({
    super.key,
    required this.collegesListModel,
  });
  final CollegesListModel collegesListModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(collegesListModel.collegeName),
      trailing: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).drawerTheme.backgroundColor,
        ),
        child: Center(
          child: Text(
            collegesListModel.count.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
