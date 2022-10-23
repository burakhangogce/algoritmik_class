import '../../../core/mixins/service_mixin.dart';
import 'package:algoritmik_class/business/services/general/infact_service_base.dart';

class LoginServices extends AlgoritmikServiceBase with ServiceMixin {
  LoginServices() {
    url = settingService.getDataUrl();
    path = 'common';
  }
}
