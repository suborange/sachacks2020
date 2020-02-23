import 'package:lean_provider/core/model/entry.dart';
import 'package:lean_provider/core/services/local_storage_service.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';

import '../../../../locator.dart';
import '../../../constants/view_routes.dart';
import '../../../services/navigation_service.dart';

class HomeModel extends BaseModel {
  final _nav = locator<NavigationService>();
  final _local = locator<LocalStorageService>();

  List<Entry> recentEntries;
  List<Entry> allEntries;

  void init() async {
    allEntries = _local.getEntries();
    recentEntries = prepRecent(allEntries);
    _local.savedEntries$.listen((list) {
      allEntries = list;
      recentEntries = prepRecent(list);
      notifyListeners();
      print(recentEntries[0].text);
    });
    notifyListeners();
  }

  List<Entry> prepRecent(List<Entry> list) {
    return list.sublist(list.length - 5).reversed.toList();
  }

  void hello() {
    _nav.pushNamed(ViewRoutes.enterForm);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
