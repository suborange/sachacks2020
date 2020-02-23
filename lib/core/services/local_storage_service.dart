import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lean_provider/core/model/entry.dart';
import 'package:rxdart/subjects.dart';

class LocalStorageService {
  Box entries;
  Box userData;
  Box stats;

  final _entries = BehaviorSubject<List<Entry>>();
  Stream<List<Entry>> get savedEntries$ => _entries.stream;

  final _avgPositivity = BehaviorSubject<double>();
  Stream<double> get avgPositivity$ => _avgPositivity.stream;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(EntryAdapter());
    entries = await Hive.openBox('entries');
    userData = await Hive.openBox('userData');
    stats = await Hive.openBox('stats');
  }

  void addEntry(Entry entry) {
    List<Entry> entryList = getEntries();
    entryList.add(entry);
    entries.put('list', entryList);
    addStats(entry);
  }

  void addStats(Entry entry) {
    int numEntries = getNumberOfEntries();

    double totalPositivity = getAvgPositivity() * numEntries;
    totalPositivity = totalPositivity + entry.positivity;
    numEntries += 1;
    var avgPositivity = totalPositivity / numEntries;
    stats.put('numberOfEntries', numEntries);
    stats.put('avgPositivity', avgPositivity);
    getAvgPositivity();
  }

  double getAvgPositivity() {
    double avg = stats.get('avgPositivity') ?? 0;
    _avgPositivity.add(avg);
    return avg;
  }

  int getNumberOfEntries() {
    return stats.get('numberOfEntries') ?? 0;
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
    _entries.add(list);
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
