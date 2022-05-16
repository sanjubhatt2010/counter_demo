import 'package:counter_app/models/state_model.dart';
import 'package:counter_app/models/user_model.dart';

class UserListViewModel {
  DataState dataState;
  List<UserModel> userList;

  UserListViewModel({
    required this.dataState,
    required this.userList,
  });
}
