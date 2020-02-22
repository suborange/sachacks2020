import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/view.dart';
import 'package:lean_provider/core/ui_models/tab_model.dart';
import 'package:lean_provider/ui/views/base_view.dart';
import 'package:lean_provider/ui/views/home/home_view.dart';
import 'package:lean_provider/ui/views/settings/settings_view.dart';

class TabContainer extends StatelessWidget {
  final View view;

  TabContainer({Key key, @required this.view})
      : assert(view != null),
        super(key: key);

  final List<BottomNavigationBarItem> _tabItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Home"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text("Settings"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<TabModel>(
      onModelReady: (model) => model.init(view),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("The App"),
        ),
        body: IndexedStack(
          index: model.currentTab,
          children: <Widget>[
            HomeView(),
            SettingsView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _tabItems,
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentTab,
          onTap: (index) => model.changeTab(context, index),
        ),
      ),
    );
  }
}
