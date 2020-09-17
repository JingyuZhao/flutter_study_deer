import 'package:flutter_study/mvp/mvps.dart';

class BasePresenter<V extends IMvpView> extends IPresenter {
  V view;

  @override
  void deactivate() {}

  @override
  void didChangeDependencies() {}

  @override
  void didUpdateWidgets<V>(V oldWidget) {}

  @override
  void dispose() {}

  @override
  void initState() {}
}
