import 'package:flutter_study/pages/shop/shop_page.dart';
import 'package:flutter_study/routers/router_init.dart';
import 'package:fluro/fluro.dart';

class ShopRouter implements IRouterProvider {
  static String shopPage = '/shop';
  static String shopSettingPage = '/shop/shopSetting';
  static String messagePage = '/shop/message';
  static String freightConfigPage = '/shop/freightConfig';
  static String addressSelectPage = '/shop/addressSelect';

  @override
  void initRouter(Router router) {
    router.define(shopPage,
        handler: Handler(handlerFunc: (_, __) => ShopPage()));
    // router.define(shopSettingPage,
    //     handler: Handler(handlerFunc: (_, __) => ShopSettingPage()));
    // router.define(messagePage,
    //     handler: Handler(handlerFunc: (_, __) => MessagePage()));
    // router.define(freightConfigPage,
    //     handler: Handler(handlerFunc: (_, __) => FreightConfigPage()));
    // router.define(addressSelectPage,
    //     handler: Handler(handlerFunc: (_, __) => AddressSelectPage()));
  }
}
