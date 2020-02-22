import 'package:hive/hive.dart';

part 'entry.g.dart';

@HiveType(typeId: 0)
class Entry {
  @HiveField(0)
  String text;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  double positivity;

  Entry({
    this.text,
    this.date,
    this.positivity,
  });
}
