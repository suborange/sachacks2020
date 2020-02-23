import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/view_state.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/services/api_service.dart';
import 'package:lean_provider/core/services/local_storage_service.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';

import '../../../../locator.dart';
import '../../../services/navigation_service.dart';

class EnterFormModel extends BaseModel {
  final _nav = locator<NavigationService>();
  final _local = locator<LocalStorageService>();
  final _api = locator<ApiService>();

  final controller = TextEditingController();

  void init() async {}

  void cancel() {
    _nav.pop();
  }

  void done() async {
    String text = controller.text;

    // TODO: ANALYZE THE TEXT AND ASSIGN IT TO THE POSITIVITY
    setState(ViewState.Busy);
    await _api.analyze(text);
    setState(ViewState.Idle);

    DateTime date = DateTime.now();
    double positivity = 0;
    _local.addEntry(Entry(text: text, date: date, positivity: positivity));
    _nav.pop();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
