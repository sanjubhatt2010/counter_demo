import 'package:counter_app/bloc/bloc.dart';
import 'package:counter_app/firebase/firebase_authentication.dart';
import 'package:counter_app/firebase/firebase_helper/app_error_code.dart';
import 'package:counter_app/models/state_model.dart';
import 'package:counter_app/module/login/view_model/login_view_model.dart';

class LoginBloc extends Bloc<LoginViewModel> {
  @override
  LoginViewModel initDefaultValue() {
    return LoginViewModel(
      dataState: DataState.initial,
    );
  }

  Future<void> login(LoginType loginType) async {
    state.dataState = DataState.loading;
    emit(state);

    if (loginType == LoginType.google) {
      ResponseModel responseModel =
          await FirebaseAuthentication.authInstance.googleSignIn();
      if (responseModel.statusCode == AppErrorCode.success) {
        state.dataState = DataState.success;
      } else {
        state.dataState = DataState.failed;
      }
    }
    emit(state);
  }
}

enum LoginType {
  google,
}
