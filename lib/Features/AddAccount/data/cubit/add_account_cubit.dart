import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gppharmacy/Features/AddAccount/data/UsersModel.dart';
import 'package:gppharmacy/Features/AddAccount/data/cubit/add_account_state.dart';
import 'package:gppharmacy/Features/Auth/data/User_Model.dart';
import 'package:gppharmacy/Utils/DioService.dart';
import 'package:meta/meta.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  AddAccountCubit() : super(AddAccountInitial());

  void addAccount({required Users user}) async {
    emit(AddAccountLoading());

    try {
      Response response = await DioService.postData(
        url: '/pharmacy/users',
        data: user.toJson(user: user),
      );
      emit(AddAccountSuccess());
    } catch (e) {
      print(e.toString());
      emit(AddAccountFailure());
    }
  }
}
