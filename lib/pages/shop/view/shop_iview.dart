import 'package:flutter_study/mvp/mvps.dart';
import 'package:flutter_study/pages/shop/models/user_entity.dart';

abstract class ShopIMvpView implements IMvpView {
  void setUser(UserEntity user);

  bool get isAccessibilityTest;
}
