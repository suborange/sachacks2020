import 'package:lean_provider/core/services/local_storage_service.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';
import 'package:lean_provider/locator.dart';

class SettingsModel extends BaseModel {
  final _local = locator<LocalStorageService>();
  double avgPositivity = 0;

  double get adjustedAvg {
    return ((avgPositivity + 1) / 2) * 100;
  }

  void init() async {
    avgPositivity = _local.getAvgPositivity();
    _local.avgPositivity$.listen((value) {
      avgPositivity = value;
      notifyListeners();
    });
    print("the avg: $avgPositivity");
  }

  @override
  void dispose() {
    super.dispose();
  }
}
