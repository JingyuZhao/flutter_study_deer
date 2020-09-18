import 'package:flutter/material.dart';
import 'package:flutter_study/pages/order/widgets/order_search_bar.dart';
import 'package:flutter_study/utils/toast.dart';

class GoodsSearchPage extends StatefulWidget {
  @override
  _GoodsSearchPageState createState() => _GoodsSearchPageState();
}

class _GoodsSearchPageState extends State<GoodsSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: '请输入商品名称查询',
        onPressed: (text) => Toast.show('搜索内容：$text'),
      ),
      body: Container(),
    );
  }
}
