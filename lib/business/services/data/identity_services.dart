import 'dart:convert';

import 'package:algoritmik_class/business/services/general/infact_service_base.dart';

import '../../../core/mixins/service_mixin.dart';
import '../../models/change_password_input_model.dart';
import '../../models/event_output_model.dart';
import '../../models/login_input_model.dart';
import '../../models/login_output_model.dart';
import '../../models/user_info_model.dart';
import 'package:http/http.dart' as http;

class IdentityServices extends AlgoritmikServiceBase with ServiceMixin {
  IdentityServices() {
    url = settingService.getRegisterUrl();
    path = 'token';
  }

  // Future login(LoginInputModel request) async {
  //   Map<String, dynamic> loginMap = await postMapAsync<Map<String, dynamic>>(
  //       getUri('').toString(), createHeaders(), request.toJson(), null);
  //   return loginMap;
  // }

  Future<String> login(LoginInputModel request) async {
    final response = await http.post(getUri(''),
        headers: createHeaders(), body: request.toJson());

    return response.body;
  }

  Future<UserInfoModel> getUser() async {
    Map<String, dynamic> map = await getMapAsync<Map<String, dynamic>>(
        getUri("connect/userinfo").toString(), createHeaders(), null);

    return UserInfoModel.fromMap(map);
  }

  Future<EventOutputModel> changePassword(
      ChangePasswordInputModel request) async {
    Map<String, dynamic> map = await postMapAsync<Map<String, dynamic>>(
        getUri('User/sendotp').toString(),
        createHeaders(),
        json.encode(request.toJson()),
        null);
    return EventOutputModel.fromJson(map);
  }
}
