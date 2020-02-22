import 'package:lean_provider/core/constants/view_routes.dart';
import 'package:lean_provider/core/enums/view.dart';
import 'package:lean_provider/core/services/navigation_service.dart';
import 'package:lean_provider/core/ui_models/base_model.dart';
import 'package:lean_provider/locator.dart';

class SplashScreenModel extends BaseModel {
  final _navigationService = locator<NavigationService>();

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 1));
    _navigationService.pushReplacementNamed(ViewRoutes.tabContainer,
        arguments: View.Home);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
