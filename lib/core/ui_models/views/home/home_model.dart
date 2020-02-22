import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/services/local_storage_service.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';

import '../../../../locator.dart';
import '../../../constants/view_routes.dart';
import '../../../services/navigation_service.dart';

class HomeModel extends BaseModel {
  final _nav = locator<NavigationService>();
  final _local = locator<LocalStorageService>();

  List<Entry> entries;

  void init() async {
    entries = _local.getEntries();
    _local.savedEntries$.listen((list) {
      entries = list;
    });
    notifyListeners();
  }

  void hello() {
    _nav.pushNamed(ViewRoutes.enterForm);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
