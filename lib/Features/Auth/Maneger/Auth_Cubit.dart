import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gppharmacy/Features/Auth/Maneger/Auth_Cubit_State.dart';
import 'package:gppharmacy/Features/Auth/data/User_Model.dart';
import 'package:gppharmacy/Utils/Constant.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(InitialAuthState());
  final String loginURL = Constant.BasURL + Constant.SignIn;
  late final UserModel user;
  final dio = Dio();

  signIn(String username, String password) async {
    try {
      Response response = await dio
          .post(loginURL, data: {'username': username, 'password': password});
      user = UserModel.fromJson(response.data);
      emit(SuccessAuthState());
    } on DioException catch (e) {
      emit(FaulierAuthState());
    }
  }
}
