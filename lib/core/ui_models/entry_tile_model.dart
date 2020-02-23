import 'dart:core';

import 'package:flutter/material.dart';
import 'package:lean_provider/core/constants/view_routes.dart';
import 'package:lean_provider/core/enums/view_state.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/services/local_storage_service.dart';
import 'package:lean_provider/core/services/navigation_service.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';
import 'package:lean_provider/locator.dart';

class EntryTileModel extends BaseModel {
  NavigationService _nav = locator<NavigationService>();
  LocalStorageService _local = locator<LocalStorageService>();
  Entry entry;
  Key key;

  Future<void> init(Entry newEntry, Key ideaKey) async {
    setState(ViewState.Busy);
    entry = newEntry;
    key = ideaKey;
    setState(ViewState.Idle);
  }

  Future<void> delete() async {
    _local.deleteEntry(entry);
  }

  void viewDetails() {
    _nav.pushNamed(ViewRoutes.entryDetail, arguments: entry);
  }
}
