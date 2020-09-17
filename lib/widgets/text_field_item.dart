import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/res/gaps.dart';
import 'package:flutter_study/utils/number_text_input_formatter.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem(
      {Key key,
      this.controller,
      @required this.title,
      this.keyboardType = TextInputType.text,
      this.hintText = '',
      this.focusNode})
      : super(key: key);
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    final Row child = Row(
      children: [
        Text(title),
        Gaps.hGap16,
        Expanded(
            child: Semantics(
          label: hintText.isEmpty ? "请输入$title" : hintText,
          child: TextField(
            focusNode: focusNode,
            keyboardType: keyboardType,
            controller: controller,
            inputFormatters: _getInputFormatter(),
            decoration:
                InputDecoration(hintText: hintText, border: InputBorder.none),
          ),
        )),
        Gaps.hGap16
      ],
    );

    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 0.6),
        ),
      ),
      child: child,
    );
  }

  List<TextInputFormatter> _getInputFormatter() {
    if (keyboardType == const TextInputType.numberWithOptions(decimal: true)) {
      return [UsNumberTextInputFormatter()];
    }
    if (keyboardType == TextInputType.number ||
        keyboardType == TextInputType.phone) {
      return [WhitelistingTextInputFormatter.digitsOnly];
    }
    return null;
  }
}
