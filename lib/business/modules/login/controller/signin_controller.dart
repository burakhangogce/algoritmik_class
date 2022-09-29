import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../models/change_password_input_model.dart';
import '../../../models/event_output_model.dart';
import '../../../models/login_info.dart';
import '../../../models/login_input_model.dart';
import '../../../models/login_output_model.dart';
import '../../../models/login_result.dart';
import '../../../services/data/identity_services.dart';

class SigninController extends ChangeNotifier {
  final IdentityServices _identityServices = getIt.get<IdentityServices>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLoading = false;

  void updateLoading(bool showLoading) {
    isLoading = showLoading;
    notifyListeners();
  }

  Future<LoginResult?> login(String email, String password) async {
    LoginInputModel request = LoginInputModel(email: email, password: password);
    updateLoading(true);
    String response = await _identityServices.login(request);
    updateLoading(false);
    if (response.isNotEmpty) {
      loginInfo = LoginInfo(response, List.empty(), false);
      //loginInfo?.authToken = response.token;
      loginInfo?.email = email;

      return LoginResult.success;
    }
    return null;
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    ChangePasswordInputModel request = ChangePasswordInputModel(
        oldPassword: oldPassword, newPassword: newPassword);
    EventOutputModel response = await _identityServices.changePassword(request);
    return response.eventSuccess;
  }
}
