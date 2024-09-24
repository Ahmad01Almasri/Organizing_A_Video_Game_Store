import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/finished_customer.dart';
import '../../features/home/presentation/pages/home_page.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.finishedCustomersScreen:
        return MaterialPageRoute(
          builder: (_) => const FinishedCustomersScreen(),
        );
    }
    return null;
  }
}
