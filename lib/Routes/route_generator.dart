
import 'package:flutter/material.dart';
import 'package:travelday/Routes/router.dart';
import 'package:travelday/Screens/dashboardscreen.dart';
import 'package:travelday/Screens/loginscreen.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    // ignore: non_constant_identifier_names
    switch (settings.name) {
      
      case LoginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
        case DashboardRoute:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());

      default:
        return MaterialPageRoute(
            builder: (context) =>
                const LoginScreen());
    }
  }
}
