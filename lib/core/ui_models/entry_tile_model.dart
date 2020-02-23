import 'dart:core';

import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/view_state.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/services/navigation_service.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';
import 'package:lean_provider/locator.dart';

class EntryTileModel extends BaseModel {
  NavigationService nav = locator<NavigationService>();
  Entry entry;
  Key key;

  Future<void> init(Entry newEntry, Key ideaKey) async {
    setState(ViewState.Busy);
    entry = newEntry;
    key = ideaKey;
    setState(ViewState.Idle);
  }
}
