import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gppharmacy/Features/AddAccount/data/UsersModel.dart';
import 'package:gppharmacy/Features/AddAccount/data/cubit/add_account_state.dart';
import 'package:gppharmacy/Utils/DioService.dart';

class AddAccountCubit extends Cubit<AddAccountState> {
  AddAccountCubit() : super(AddAccountInitial());

  void addAccount({required Users user}) async {
    emit(AddAccountLoading());
    Response? response;
    print(user.toJson());
    try {
      response = await DioService.postData(
        url: '/pharmacy/users',
        data: user.toJson(),
      );
      emit(AddAccountSuccess());
    } catch (e) {
      print(e.toString());
      print(response?.data);

      emit(AddAccountFailure());
    }
  }
}
