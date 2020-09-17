import 'package:flutter_study/mvp/mvps.dart';
import 'package:flutter_study/pages/order/models/search_entity.dart';
import 'package:flutter_study/provider/base_list_provider.dart';

abstract class OrderSearchIMvpView implements IMvpView {
  BaseListProvider<SearchItem> get provider;
}
