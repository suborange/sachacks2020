import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lean_provider/core/model/entry.dart';

class LocalStorageService {
  Box entries;
  Box userData;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(EntryAdapter());
    entries = await Hive.openBox('entries');
    userData = await Hive.openBox('userData');
  }

  void addEntry(Entry solution) {
    List<Entry> entryList = getEntries();
    entryList.add(solution);
    entries.put('list', entryList);
  }

  List<Entry> getEntries() {
    List<Entry> list = [];
    //TODO: HACK, MAJOR HACK
    var unCasted = entries.get('list');
    if (unCasted == null) {
      return [];
    }
    for (var item in entries.get('list')) {
      list.add(item);
    }
    return list;
  }

  int getLaunchCount() {
    return userData.get('launchCount') ?? 0;
  }

  void incrementLaunchCount() {
    int count = getLaunchCount();
    count++;
    userData.put('launchCount', count);
  }

  int getEntryCount() {
    final list = getEntries();
    return list.length;
  }
}
