import 'package:flutter/material.dart';

import 'screens/profile_page.dart';
import 'screens/register_page.dart';
class Routes{
  static const profile = "profile";
  static const register = "register";
}

class RouteManager {
  static Route<Object> generateRoutes(RouteSettings settings){
     switch (settings.name){
      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => ProfilePage(), 
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(), 
        );
      default:
       return PageRouteBuilder(pageBuilder: (_, __, ___) => Scaffold(
        body: Text("Hello"),
       ));
    }
  }
}
