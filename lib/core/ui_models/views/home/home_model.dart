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
  List<Entry> positiveEntries;
  List<Entry> negativeEntries;

  void init() async {
    allEntries = _local.getEntries();
    setupPosAndNegLists();
    recentEntries = prepRecent(allEntries);

    _local.savedEntries$.listen((list) {
      allEntries = list;
      recentEntries = prepRecent(list);
      setupPosAndNegLists();
      notifyListeners();
      print(recentEntries[0].text);
    });
    notifyListeners();
  }

  void setupPosAndNegLists() {
    positiveEntries = [];
    negativeEntries = [];
    for (var entry in allEntries) {
      if (entry.positivity >= 0) {
        positiveEntries.add(entry);
      }
      if (entry.positivity < 0) {
        negativeEntries.add(entry);
      }
    }
  }

  List<Entry> prepRecent(List<Entry> list) {
    if (list.length < 5) return list;
    return list.sublist(list.length - 5).reversed.toList();
  }

  void hello() {
    _nav.pushNamed(ViewRoutes.enterForm);
  }

  void viewAllEntries() {
    _nav.pushNamed(ViewRoutes.entryList, arguments: allEntries);
  }

  void viewPositiveEntries() {
    _nav.pushNamed(ViewRoutes.entryList, arguments: positiveEntries);
  }

  void viewNegativeEntries() {
    _nav.pushNamed(ViewRoutes.entryList, arguments: negativeEntries);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
