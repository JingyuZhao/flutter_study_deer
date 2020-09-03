import 'package:azlistview/azlistview.dart';
import 'package:flutter_study/generated/json/base/json_convert_content.dart';

class BankEntity with JsonConvert<BankEntity>, ISuspensionBean {
  int id;
  String bankName;
  String firstLetter;

  BankEntity({this.id, this.bankName, this.firstLetter});

  @override
  String getSuspensionTag() {
    return firstLetter;
  }
}
