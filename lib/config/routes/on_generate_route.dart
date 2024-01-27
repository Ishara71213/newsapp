import 'package:flutter/material.dart';
import 'package:newsapp/config/routes/route_const.dart';
import 'package:newsapp/core/common/screens/splash_screen.dart';
import 'package:newsapp/core/common/screens/splash_screen_data_loader.dart';
import 'package:newsapp/features/News/presentation/filter_screen/screens/filter_screen.dart';
import 'package:newsapp/features/News/presentation/home_screen/screens/home_screen.dart';
import 'package:newsapp/features/News/presentation/saved_news/screens/saved_news_screen.dart';
import 'package:newsapp/features/News/presentation/settings/screens/settings_screen.dart';
import 'package:newsapp/features/News/presentation/single_news/screens/single_news_screen.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;
    String routeName = settings.name.toString();
    switch (settings.name) {
      case RouteConst.initialRoute:
        return materialBuilder(widget: const HomeScreen(), route: routeName);
      case RouteConst.splashScreen:
        return materialBuilder(widget: const SplashScreen(), route: routeName);
      case RouteConst.splashDataLoadScreen:
        return materialBuilder(
            widget: const SplashDataLoadScreen(), route: routeName);

      case RouteConst.homeScreen:
        return materialBuilder(widget: const HomeScreen(), route: routeName);
      case RouteConst.singleNewsScreen:
        return materialBuilder(
            widget: SingleNewsScreen(data: args), route: routeName);
      case RouteConst.filterScreen:
        return materialBuilder(widget: const FilterScreen(), route: routeName);
      case RouteConst.savedNewsScreen:
        return materialBuilder(
            widget: const SavedNewsScreen(), route: routeName);
      case RouteConst.settingsScreen:
        return materialBuilder(
            widget: const SettingsScreen(), route: routeName);

      //error page
      default:
        return MaterialPageRoute(builder: (context) => const ErrorPage());
    }
  }
}

//return the requested widget
MaterialPageRoute materialBuilder(
    {required Widget widget, required String route}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: route), builder: (context) => widget);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
    );
  }
}
