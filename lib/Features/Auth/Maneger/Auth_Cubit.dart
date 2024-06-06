import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit_State.dart';
import 'package:gppharmacy/Features/Auth/data/User_Model.dart';
import 'package:gppharmacy/Utils/DioService.dart';
import 'package:gppharmacy/Utils/Constant.dart';
import 'package:gppharmacy/Utils/Shared_Prefrences.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(InitialAuthState());

  late UserModel? user;

  signIn(String username, String password) async {
    emit(AuthLoadingState());
    try {
      Response response = await DioService.signIn(
          url: Constant.SignIn,
          data: {'username': username, 'password': password});
      user = UserModel.fromJson(response.data);
      SharedPref.saveString(value: user!.token, key: 'token');
      emit(SuccessAuthState(user: user!.name));
    } on DioException catch (e) {
      emit(FaulierAuthState(errorMsg: e.response?.data['message'] ?? "Error"));
    }
  }

  signOut() {
    user = null;
    emit(InitialAuthState());
  }

  validateToken() async {
    String? token = SharedPref.getString(key: "token");

    if (token != null) {
      emit(ValidatingTokenLoading());

      try {
        Response response =
            await DioService.getDate(url: "/auth/validate?token=$token");
        if (response.statusCode == 200) {
          emit(ValidatingTokenSuccess());
        } else {
          throw Exception("Not valid");
        }
      } on Exception catch (e) {
        emit(ValidatingTokenFailed());
      }
    } else {
      emit(ValidatingTokenFailed());
    }
  }
}
