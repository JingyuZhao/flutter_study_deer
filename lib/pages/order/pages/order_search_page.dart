import 'package:flutter/material.dart';
import 'package:flutter_study/mvp/base_page.dart';
import 'package:flutter_study/mvp/power_presenter.dart';
import 'package:flutter_study/pages/order/models/search_entity.dart';
import 'package:flutter_study/pages/order/presenter/order_search_presenter.dart';
import 'package:flutter_study/pages/order/view/order_search_iview.dart';
import 'package:flutter_study/pages/order/widgets/order_search_bar.dart';
import 'package:flutter_study/pages/shop/models/user_entity.dart';
import 'package:flutter_study/pages/shop/presenter/shop_presenter.dart';
import 'package:flutter_study/pages/shop/view/shop_iview.dart';
import 'package:flutter_study/provider/base_list_provider.dart';
import 'package:flutter_study/widgets/my_refresh_list.dart';
import 'package:flutter_study/widgets/state_layout.dart';
import 'package:provider/provider.dart';

class OrderSearchPage extends StatefulWidget {
  OrderSearchPage({Key key}) : super(key: key);

  @override
  _OrderSearchPageState createState() => _OrderSearchPageState();
}

class _OrderSearchPageState extends State<OrderSearchPage>
    with BasePageMixin<OrderSearchPage, PowerPresenter>
    implements OrderSearchIMvpView, ShopIMvpView {
  BaseListProvider<SearchItem> provider = BaseListProvider<SearchItem>();

  String _keyword;
  int _page = 1;

  @override
  void initState() {
    /// 默认为加载中状态，本页面场景默认为空
    provider.setStateTypeNotNotify(StateType.empty);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BaseListProvider<SearchItem>>(
      create: (_) => provider,
      child: Scaffold(
        appBar: SearchBar(
          hintText: '请输入手机号或姓名查询',
          onPressed: (text) {
            if (text.isEmpty) {
              showToast('搜索关键字不能为空！');
              return;
            }
            _keyword = text;
            provider.setStateType(StateType.loading);
            _page = 1;
            _orderSearchPresenter.search(_keyword, _page, true);
          },
        ),
        body:
            Consumer<BaseListProvider<SearchItem>>(builder: (_, provider, __) {
          return DeerListView(
            key: const Key('order_search_list'),
            itemCount: provider.list.length,
            stateType: provider.stateType,
            onRefresh: _onRefresh,
            loadMore: _loadMore,
            itemExtent: 50.0,
            hasMore: provider.hasMore,
            itemBuilder: (_, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(provider.list[index].name),
              );
            },
          );
        }),
      ),
    );
  }

  Future<void> _onRefresh() async {
    _page = 1;
    await _orderSearchPresenter.search(_keyword, _page, false);
  }

  Future<void> _loadMore() async {
    _page++;
    await _orderSearchPresenter.search(_keyword, _page, false);
  }

  OrderSearchPresenter _orderSearchPresenter;
  ShopPagePresenter _shopPagePresenter;

  @override
  PowerPresenter createPresenter() {
    final PowerPresenter powerPresenter = PowerPresenter(this);
    _orderSearchPresenter = OrderSearchPresenter();
    _shopPagePresenter = ShopPagePresenter();
    powerPresenter
        .requestPresenter([_orderSearchPresenter, _shopPagePresenter]);
    return powerPresenter;
  }

  @override
  bool get isAccessibilityTest => false;

  @override
  void setUser(UserEntity user) {
    showToast(user.name);
  }
}
