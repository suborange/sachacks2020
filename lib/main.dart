import 'package:flutter/material.dart';
import 'package:lean_provider/core/enums/connectivity_status.dart';
import 'package:lean_provider/core/services/connectivity_service.dart';
import 'package:lean_provider/core/services/navigation_service.dart';
import 'package:lean_provider/locator.dart';
import 'package:lean_provider/ui/router.dart';
import 'package:lean_provider/ui/themes/dark_theme.dart';
import 'package:lean_provider/ui/themes/light_theme.dart';
import 'package:lean_provider/ui/views/no_network_view.dart';
import 'package:lean_provider/ui/views/splash_screen/splash_screen_view.dart';
import 'package:lean_provider/ui/widgets/network_sensitive.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      create: (context) =>
          locator<ConnectivityService>().connectionStatusController.stream,
      child: NetworkSensitive(
        child: MaterialApp(
          title: 'The App',
          theme: lightTheme,
          darkTheme: darkTheme,
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: Router.generateRoute,
          home: SplashScreenView(),
        ),
        altChild: MaterialApp(
          title: 'No Connection',
          theme: lightTheme,
          darkTheme: darkTheme,
          home: NoNetworkView(),
        ),
      ),
    );
  }
}
