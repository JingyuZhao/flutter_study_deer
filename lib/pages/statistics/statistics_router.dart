import 'package:flutter_study/pages/statistics/pages/goods_statistics_page.dart';
import 'package:flutter_study/pages/statistics/pages/order_statistics_page.dart';
import 'package:flutter_study/routers/router_init.dart';
import 'package:fluro/fluro.dart';

class StatisticsRouter implements IRouterProvider {
  static String orderStatisticsPage = '/statistics/order';
  static String goodsStatisticsPage = '/statistics/goods';

  @override
  void initRouter(Router router) {
    router.define(orderStatisticsPage,
        handler: Handler(handlerFunc: (_, params) {
      final int index = int.parse(params['index']?.first);
      return OrderStatisticsPage(index);
    }));
    router.define(goodsStatisticsPage,
        handler: Handler(handlerFunc: (_, __) => GoodsStatisticsPage()));
  }
}
