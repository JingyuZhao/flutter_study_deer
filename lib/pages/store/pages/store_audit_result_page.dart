import 'package:flutter/material.dart';
import 'package:flutter_study/custom/load_image.dart';
import 'package:flutter_study/res/resources.dart';
import 'package:flutter_study/routers/fluro_navigator.dart';
import 'package:flutter_study/widgets/app_bar.dart';
import 'package:flutter_study/widgets/my_button.dart';
import 'package:flutter_study/routers/router.dart';

class StoreAuditResultPage extends StatefulWidget {
  StoreAuditResultPage({Key key}) : super(key: key);

  @override
  _StoreAuditResultPageState createState() => _StoreAuditResultPageState();
}

class _StoreAuditResultPageState extends State<StoreAuditResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "审核结果",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.vGap50,
            const LoadAssetImage(
              "store/icon_success",
              height: 80,
              width: 80,
            ),
            Gaps.vGap12,
            Text(
              '恭喜，店铺资料审核成功',
              style: TextStyles.textSize16,
            ),
            Gaps.vGap8,
            Text(
              '2019-02-21 15:20:10',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Gaps.vGap8,
            Text(
              '预计完成时间：02月28日',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Gaps.vGap24,
            MyButton(
              onPressed: () {
                NavigatorUtils.push(context, Routers.home, clearStack: true);
              },
              text: '进入',
            )
          ],
        ),
      ),
    );
  }
}
