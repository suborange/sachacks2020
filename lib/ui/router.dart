import 'package:flutter/material.dart';
import 'package:lean_provider/core/constants/view_routes.dart';
import 'package:lean_provider/core/enums/view.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/ui/views/enter_form/enter_form_view.dart';
import 'package:lean_provider/ui/views/entry_detail/entry_detail_view.dart';
import 'package:lean_provider/ui/views/entry_list/entry_list_view.dart';
import 'package:lean_provider/ui/views/home/home_view.dart';
import 'package:lean_provider/ui/views/tab_container.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: RouteSettings(name: settings.name),
      builder: (context) => _generateView(settings),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    switch (settings.name) {
      case ViewRoutes.home:
        return HomeView();

      case ViewRoutes.enterForm:
        return EnterFormView();
      case ViewRoutes.entryDetail:
        final entry = settings.arguments as Entry;
        return EntryDetailView(entry: entry);
      case ViewRoutes.entryList:
        final list = settings.arguments as List<Entry>;
        return EntryListView(
          entries: list,
        );

      case ViewRoutes.tabContainer:
        final view = settings.arguments as View;
        return TabContainer(view: view);
    }
  }
}
