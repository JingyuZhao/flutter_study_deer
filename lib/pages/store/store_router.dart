import 'package:flutter_study/routers/router_init.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_study/pages/store/pages/store_audit_page.dart';
import 'package:flutter_study/pages/store/pages/store_audit_result_page.dart';

class StoreRouter implements IRouterProvider {
  static String auditPage = '/store/audit';
  static String auditResultPage = '/store/auditResult';

  @override
  void initRouter(Router router) {
    // TODO: implement initRouter
    router.define(auditPage,
        handler: Handler(handlerFunc: (_, __) => StoreAuditPage()));
    router.define(auditResultPage,
        handler: Handler(
          handlerFunc: (context, parameters) => StoreAuditResultPage(),
        ));
  }
}
