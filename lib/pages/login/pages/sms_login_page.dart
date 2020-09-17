import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_study/pages/login/login_router.dart';
import 'package:flutter_study/res/resources.dart';
import 'package:flutter_study/routers/fluro_navigator.dart';
import 'package:flutter_study/utils/change_notifier_manage.dart';
import 'package:flutter_study/pages/login/widget/my_text_field.dart';
import 'package:flutter_study/utils/date_utils_helper.dart';
import 'package:flutter_study/utils/toast.dart';
import 'package:flutter_study/widgets/app_bar.dart';
import 'package:flutter_study/widgets/my_button.dart';
import 'package:flutter_study/widgets/my_scroll_view.dart';

class SMSLoginPage extends StatefulWidget {
  SMSLoginPage({Key key}) : super(key: key);

  @override
  _SMSLoginPageState createState() => _SMSLoginPageState();
}

class _SMSLoginPageState extends State<SMSLoginPage>
    with ChangeNotifierMixin<SMSLoginPage> {
  final TextEditingController phoneVc = TextEditingController();
  final TextEditingController codeVc = TextEditingController();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode codeFocus = FocusNode();

  bool _clickable = false;

  void _vercify() {
    final String name = phoneVc.text;
    final String vCode = codeVc.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      clickable = false;
    }

    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: MyScrollView(
        children: _buildBody(),
        keyboardConfig: Utils.getKeyboardActionsConfig(
            context, <FocusNode>[phoneFocus, codeFocus]),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      ),
    );
  }

  @override
  Map<ChangeNotifier, List<VoidCallback>> changeNotifier() {
    final List<VoidCallback> callBacks = [_vercify];
    return {
      phoneVc: callBacks,
      codeVc: callBacks,
      phoneFocus: null,
      codeFocus: null
    };
  }

  void _login() {
    Toast.show("去登录吧");
  }

  List<Widget> _buildBody() {
    return <Widget>[
      Text(
        "验证码登录",
        style: TextStyles.textBold26,
      ),
      Gaps.vGap16,
      MyTextField(
        controller: phoneVc,
        focusNode: phoneFocus,
        maxLength: 11,
        keyboardType: TextInputType.phone,
        hintText: "输入您的手机号",
        isInputPwd: false,
        autoFocus: false,
      ),
      Gaps.vGap8,
      MyTextField(
        controller: codeVc,
        focusNode: codeFocus,
        maxLength: 6,
        isInputPwd: false,
        autoFocus: false,
        keyboardType: TextInputType.number,
        hintText: "请输入您收到的验证码",
        getVCode: () {
          Toast.show('获取验证码');
          return Future.value(true);
        },
      ),
      Gaps.vGap8,
      Container(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          child: RichText(
            text: TextSpan(
                text: "注册协议",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: Dimens.font_sp14),
                children: [
                  TextSpan(
                      text: "注册",
                      style: TextStyle(color: Theme.of(context).errorColor)),
                  TextSpan(text: window.locale.languageCode == "zh" ? '。' : ".")
                ]),
          ),
          onTap: () => NavigatorUtils.push(context, LoginRouter.registerPage),
        ),
      ),
      Gaps.vGap24,
      MyButton(
        onPressed: _clickable ? _login : null,
        text: "登录",
      ),
      Container(
        height: 40.0,
        alignment: Alignment.centerRight,
        child: GestureDetector(
          child: Text(
            "忘记密码",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          onTap: () =>
              NavigatorUtils.push(context, LoginRouter.resetPasswordPage),
        ),
      )
    ];
  }
}
