import 'package:flutter/material.dart';

class NavigationHandler {
  static void navigateWithArgumnets(
      BuildContext context, String path, Map<String, dynamic> args) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    if (previousRouteName != path) {
      Navigator.pushNamed(context, path, arguments: args);
    }
  }

  static void navigateWithRemovePrevRoute(BuildContext context, String path) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    if (previousRouteName != path) {
      Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
    }
  }

  static void navigate(BuildContext context, String path) {
    String? previousRouteName =
        ModalRoute.of(context)?.settings.name.toString();
    if (previousRouteName != path) {
      Navigator.pushNamed(context, path);
    }
  }
}
