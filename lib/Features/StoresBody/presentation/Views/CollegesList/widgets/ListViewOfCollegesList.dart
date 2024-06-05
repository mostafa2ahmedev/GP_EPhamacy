import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/CollegesListCubit/colleges_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/CollegesList/widgets/ListTileForCollegesList.dart';

class ListViewOfCollegesList extends StatelessWidget {
  const ListViewOfCollegesList({super.key});

  @override
  Widget build(BuildContext context) {
    var collegesList = BlocProvider.of<CollegesCubit>(context).collegesList;
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
        itemCount: collegesList.length,
        itemBuilder: (context, index) {
          return ListTileForCollegesList(
              collegesListModel: collegesList[index]);
        },
      ),
    );
  }
}
