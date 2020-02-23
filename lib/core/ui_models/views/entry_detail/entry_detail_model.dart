import 'package:flutter/material.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';

class EntryDetailModel extends BaseModel {
  Entry entry;

  void init(Entry newEntry) async {
    entry = newEntry;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
