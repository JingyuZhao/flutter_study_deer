import 'package:flutter_study/pages/order/order_page.dart';
import 'package:flutter_study/pages/order/pages/order_search_page.dart';
import 'package:flutter_study/routers/router_init.dart';
import 'package:fluro/fluro.dart';

class OrderRouter implements IRouterProvider {
  static String orderPage = '/order';
  static String orderInfoPage = '/order/info';
  static String orderSearchPage = '/order/search';
  static String orderTrackPage = '/order/track';

  @override
  void initRouter(Router router) {
    router.define(orderPage,
        handler: Handler(handlerFunc: (_, __) => OrderPage()));
    // router.define(orderInfoPage,
    //     handler: Handler(handlerFunc: (_, __) => OrderInfoPage()));
    router.define(orderSearchPage,
        handler: Handler(handlerFunc: (_, __) => OrderSearchPage()));
    // router.define(orderTrackPage,
    //     handler: Handler(handlerFunc: (_, __) => OrderTrackPage()));
  }
}
