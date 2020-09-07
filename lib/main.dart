import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/common/common.dart';
import 'package:flutter_study/pages/home/splash_page.dart';
import 'package:flutter_study/provider/theme_provider.dart';
import 'package:flutter_study/widgets/pageNotFound.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_study/net/dio_utils.dart';
import 'package:flutter_study/net/intercept.dart';
import 'package:flutter_study/routers/router.dart';
import 'package:flutter_study/routers/application.dart';
import 'package:flutter_study/utils/device_util.dart';
import 'package:flutter_study/utils/log_util.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// sp初始化
  await SpUtil.getInstance();

  runApp(MyApp());

  // 透明状态栏
  if (Device.isAndroid) {
    final SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final Widget home;
  final ThemeData theme;

  _initDio() {
    final List<Interceptor> inspetor = [];
    inspetor.add(AuthInterceptor());
    inspetor.add(TokenInterceptor());
    if (!Constant.inProduction) {
      inspetor.add(LoggingInterceptor());
    }
    //适配数据结构
    inspetor.add(AdapterInterceptor());
    setDioConfig(baseUrl: "https://api.github.com/", interceptors: inspetor);
  }

  MyApp({Key key, this.home, this.theme}) {
    Log.init();
    _initDio();
    final Router router = Router();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (ctx, provider, _) {
            return MaterialApp(
                title: "Flutter Study",
                debugShowCheckedModeBanner: false,
                theme: provider.getTheme(),
                darkTheme: provider.getTheme(isDarkMode: true),
                themeMode: provider.getThemeMode(),
                home: SplashPage(),
                onGenerateRoute: Application.router.generator,
                builder: (context, child) {
                  /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                        textScaleFactor:
                            1.0), // 或者 MediaQueryData.fromWindow(WidgetsBinding.instance.window).copyWith(textScaleFactor: 1.0),
                    child: child,
                  );
                },
                onUnknownRoute: (_) {
                  return MaterialPageRoute(
                    builder: (BuildContext context) => PageNotFound(),
                  );
                });
          },
        ),
      ),
    );
  }
}
