import 'package:lean_provider/core/constants/view_routes.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/services/local_storage_service.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';

import '../../../../locator.dart';
import '../../../services/navigation_service.dart';

class EntryListModel extends BaseModel {
  final _nav = locator<NavigationService>();
  final _local = locator<LocalStorageService>();

  List<Entry> entries;

  void init(List<Entry> list) async {
    entries = list;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
