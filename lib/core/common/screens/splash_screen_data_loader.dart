import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/config/routes/route_const.dart';
import 'package:newsapp/core/utils/navigation_handler.dart';

class SplashDataLoadScreen extends StatefulWidget {
  const SplashDataLoadScreen({super.key});

  @override
  State<SplashDataLoadScreen> createState() => _SplashDataLoadScreen();
}

class _SplashDataLoadScreen extends State<SplashDataLoadScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadData();
  }

  Future<void> loadData() async {
    Future.delayed(const Duration(seconds: 2), () {
      NavigationHandler.navigateWithRemovePrevRoute(
          context, RouteConst.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/logo-on-light.svg',
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
