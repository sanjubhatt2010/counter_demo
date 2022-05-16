import 'package:counter_app/bloc/bloc.dart';
import 'package:counter_app/firebase/firebase_authentication.dart';
import 'package:counter_app/firebase/firebase_helper/app_error_code.dart';
import 'package:counter_app/models/state_model.dart';
import 'package:counter_app/module/user_list/view_model/logout_view_model.dart';

class LogoutBloc extends Bloc<LogoutViewModel> {
  @override
  LogoutViewModel initDefaultValue() {
    return LogoutViewModel(
      dataState: DataState.initial,
    );
  }

  Future<void> logout() async {
    state.dataState = DataState.loading;
    emit(state);

    ResponseModel responseModel =
        await FirebaseAuthentication.authInstance.logout();
    if (responseModel.statusCode == AppErrorCode.success) {
      state.dataState = DataState.success;
    } else {
      state.dataState = DataState.failed;
    }
    emit(state);
  }
}
