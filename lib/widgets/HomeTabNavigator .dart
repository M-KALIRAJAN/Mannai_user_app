import 'package:flutter/material.dart';
import 'package:mannai_user_app/views/screens/dashborad.dart';
import 'package:mannai_user_app/views/screens/point_details.dart';


class HomeTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(int) onTabChange;

  const HomeTabNavigator({
    super.key,
    required this.navigatorKey,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: "/home",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/home":
            return MaterialPageRoute(
              builder: (_) => Dashboard(onTabChange: onTabChange),
            );

          case "/pointdetails":
            return MaterialPageRoute(
              builder: (_) => PointDetails(),
            );

          default:
            return MaterialPageRoute(
              builder: (_) => Dashboard(onTabChange: onTabChange),
            );
        }
      },
    );
  }
}

