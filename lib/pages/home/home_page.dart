import 'package:flutter/material.dart';
import 'package:flutter_study/custom/load_image.dart';
import 'package:flutter_study/pages/goods/goods_page.dart';
import 'package:flutter_study/pages/home/provider/home_provider.dart';
import 'package:flutter_study/pages/order/order_page.dart';
import 'package:flutter_study/pages/shop/shop_page.dart';
import 'package:flutter_study/pages/statistics/statistics_page.dart';
import 'package:flutter_study/res/resources.dart';
import 'package:flutter_study/utils/double_tap_back_exit_app.dart';
import 'package:flutter_study/utils/theme_utils.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pageList;

  final List<String> _appBarTitles = ['订单', '商品', '统计', '店铺'];
  final PageController _pageController = PageController();

  List<BottomNavigationBarItem> _list;
  List<BottomNavigationBarItem> _listDark;

  HomeProvider provider = HomeProvider();

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      var _tabImages = [
        [
          const LoadAssetImage(
            'home/icon_order',
            width: 25,
            color: Colours.unselected_item_color,
          ),
          const LoadAssetImage(
            'home/icon_order',
            width: 25.0,
            color: Colours.app_main,
          ),
        ],
        [
          const LoadAssetImage(
            'home/icon_commodity',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadAssetImage(
            'home/icon_commodity',
            width: 25.0,
            color: Colours.app_main,
          ),
        ],
        [
          const LoadAssetImage(
            'home/icon_statistics',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadAssetImage(
            'home/icon_statistics',
            width: 25.0,
            color: Colours.app_main,
          ),
        ],
        [
          const LoadAssetImage(
            'home/icon_shop',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadAssetImage(
            'home/icon_shop',
            width: 25.0,
            color: Colours.app_main,
          ),
        ]
      ];

      _list = List.generate(4, (index) {
        return BottomNavigationBarItem(
            icon: _tabImages[index][0],
            activeIcon: _tabImages[index][1],
            title: Padding(
              padding: const EdgeInsets.only(top: 1.5),
              child: Text(
                _appBarTitles[index],
                key: Key(_appBarTitles[index]),
              ),
            ));
      });
    }
    return _list;
  }

  List<BottomNavigationBarItem> _buildDarkBottomNavigationBarItem() {
    if (_listDark == null) {
      var _tabImagesDark = [
        [
          const LoadAssetImage('home/icon_order', width: 25.0),
          const LoadAssetImage(
            'home/icon_order',
            width: 25.0,
            color: Colours.dark_app_main,
          ),
        ],
        [
          const LoadAssetImage('home/icon_commodity', width: 25.0),
          const LoadAssetImage(
            'home/icon_commodity',
            width: 25.0,
            color: Colours.dark_app_main,
          ),
        ],
        [
          const LoadAssetImage('home/icon_statistics', width: 25.0),
          const LoadAssetImage(
            'home/icon_statistics',
            width: 25.0,
            color: Colours.dark_app_main,
          ),
        ],
        [
          const LoadAssetImage('home/icon_shop', width: 25.0),
          const LoadAssetImage(
            'home/icon_shop',
            width: 25.0,
            color: Colours.dark_app_main,
          ),
        ]
      ];

      _listDark = List.generate(4, (i) {
        return BottomNavigationBarItem(
            icon: _tabImagesDark[i][0],
            activeIcon: _tabImagesDark[i][1],
            title: Padding(
              padding: const EdgeInsets.only(top: 1.5),
              child: Text(
                _appBarTitles[i],
                key: Key(_appBarTitles[i]),
              ),
            ));
      });
    }
    return _listDark;
  }

  void _onPageChanged(int index) {
    provider.value = index;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() {
    _pageList = [
      OrderPage(),
      GoodsPage(),
      StatisticsPage(),
      ShopPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = ThemeUtils.isDark(context);

    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => provider,
      child: DoubleTapBackExitApp(
        child: Scaffold(
            bottomNavigationBar: Consumer<HomeProvider>(
              builder: (_, provider, __) {
                return BottomNavigationBar(
                  backgroundColor: ThemeUtils.getBackgroundColor(context),
                  items: isDark
                      ? _buildDarkBottomNavigationBarItem()
                      : _buildBottomNavigationBarItem(),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: provider.value,
                  elevation: 5.0,
                  iconSize: 21.0,
                  selectedFontSize: Dimens.font_sp10,
                  unselectedFontSize: Dimens.font_sp10,
                  selectedItemColor: Theme.of(context).primaryColor,
                  unselectedItemColor: isDark
                      ? Colours.dark_unselected_item_color
                      : Colours.unselected_item_color,
                  onTap: (index) => _pageController.jumpToPage(index),
                );
              },
            ),
            // 使用PageView的原因参看 https://zhuanlan.zhihu.com/p/58582876
            body: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _pageList,
              physics: const NeverScrollableScrollPhysics(), // 禁止滑动
            )),
      ),
    );
  }
}
