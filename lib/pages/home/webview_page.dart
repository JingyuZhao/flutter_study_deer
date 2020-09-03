import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({Key key, @required this.title, @required this.url})
      : super(key: key);
  final String title;
  final String url;
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
