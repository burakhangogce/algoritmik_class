import 'package:algoritmik_class/business/services/data/identity_services.dart';
import 'package:algoritmik_class/business/services/data/info_services.dart';
import 'package:get_it/get_it.dart';

import '../../business/services/general/setting_service.dart';

class ServiceContainer {
  static Future registerService() async {
    var service = SettingService();
    await service.init();

    GetIt.I.registerSingleton<SettingService>(SettingService());
    GetIt.I.registerSingleton<IdentityServices>(IdentityServices());
    GetIt.I.registerSingleton<InfoServices>(InfoServices());
    // GetIt.I.registerSingleton<AkisServices>(AkisServices());
    // GetIt.I.registerSingleton<FirmaServices>(FirmaServices());
    // GetIt.I.registerSingleton<FileServices>(FileServices());
    // GetIt.I.registerSingleton<OtofaturaServices>(OtofaturaServices());
    // GetIt.I.registerSingleton<PesinIskontoServices>(PesinIskontoServices());
    // GetIt.I.registerSingleton<NotificationService>(NotificationService());
    // GetIt.I.registerSingleton<NotificationDeviceServices>(
    //     NotificationDeviceServices());
  }
}
