import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/view.dart';
import 'package:lean_provider/core/enums/view_state.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';

const Home = 0;
const Settings = 0;

class TabModel extends BaseModel {
  int _currentTab;
  int get currentTab => _currentTab;

  init(View view) {
    switch (view) {
      case View.Settings:
        _currentTab = Settings;
        break;
      default:
        _currentTab = Home;
    }
    setState(ViewState.Idle);
  }

  void changeTab(BuildContext context, int index) {
    _currentTab = index;
    setState(ViewState.Idle);
  }
}
