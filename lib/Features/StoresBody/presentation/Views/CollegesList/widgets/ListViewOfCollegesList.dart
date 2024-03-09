import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Maneger/CollegesListCubit/colleges_cubit.dart';
import 'package:gppharmacy/Features/StoresBody/presentation/Views/CollegesList/widgets/ListTileForCollegesList.dart';

class ListViewOfCollegesList extends StatelessWidget {
  const ListViewOfCollegesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollegesCubit, CollegesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var collegesCubit = BlocProvider.of<CollegesCubit>(context);

        return Expanded(
          child: ListView.builder(
            itemCount: collegesCubit.collegesList.length,
            itemBuilder: (context, index) {
              return ListTileForCollegesList(
                  collegesListModel: collegesCubit.collegesList[index]);
            },
          ),
        );
      },
    );
  }
}
