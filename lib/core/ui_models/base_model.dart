import 'package:flutter/widgets.dart';
import 'package:lean_provider/core/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  bool disposed = false;

  void setState(ViewState viewState) {
    _state = viewState;

    if (disposed) return;

    notifyListeners();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
