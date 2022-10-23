import '../../../core/mixins/service_mixin.dart';
import 'package:algoritmik_class/business/services/general/infact_service_base.dart';

class CommonServices extends AlgoritmikServiceBase with ServiceMixin {
  CommonServices() {
    url = settingService.getDataUrl();
    path = 'common';
  }
}
