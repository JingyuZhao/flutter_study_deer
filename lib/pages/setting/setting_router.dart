import 'package:flutter_study/routers/router_init.dart';
import 'package:fluro/fluro.dart';

class SettingRouter implements IRouterProvider {
  static String settingPage = '/setting';
  static String aboutPage = '/setting/about';
  static String themePage = '/setting/theme';
  static String accountManagerPage = '/setting/accountManager';

  @override
  void initRouter(Router router) {
    // router.define(settingPage,
    //     handler: Handler(handlerFunc: (_, __) => SettingPage()));
    // router.define(aboutPage,
    //     handler: Handler(handlerFunc: (_, __) => AboutPage()));
    // router.define(themePage,
    //     handler: Handler(handlerFunc: (_, __) => ThemePage()));
    // router.define(accountManagerPage,
    //     handler: Handler(handlerFunc: (_, __) => AccountManagerPage()));
  }
}
