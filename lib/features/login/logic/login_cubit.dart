import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/contants.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../../../core/networking/dio_factory.dart';
import '../data/models/login_request_body.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),

    );
    response.when(success: (loginResponse) async {
      await saveUserToken(loginResponse.userData?.token ?? '');
      final username = loginResponse.userData?.userName ?? '';
      await saveUserName(username);
       print("username: $username");
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });

  }


  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    print("Token done");
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
 Future<void> saveUserName(String name) async {
  try {
    print('save name $name');
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userName, name);
    
  
    final savedName = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName);
    print('save is done $savedName');
  } catch (e) {
    print('error to save name $e');
  }
}
}