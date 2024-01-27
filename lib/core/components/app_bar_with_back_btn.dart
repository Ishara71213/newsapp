import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/config/routes/route_const.dart';
import 'package:newsapp/config/theme/Bloc/bloc/theme_bloc.dart';
import 'package:newsapp/core/utils/navigation_handler.dart';

class AppBarWithBackBtn extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backHomeWithRefresh;
  const AppBarWithBackBtn(
      {super.key, this.title = "", this.backHomeWithRefresh = false});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != ""
          ? Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            )
          : BlocProvider.of<ThemeBloc>(context).isDarkTheme
              ? SvgPicture.asset(
                  'assets/icons/logo-on-dark.svg',
                  height: 45,
                )
              : SvgPicture.asset(
                  'assets/icons/logo-on-light.svg',
                  height: 45,
                ),
      toolbarHeight: 80,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        onPressed: () {
          backHomeWithRefresh
              ? NavigationHandler.navigateWithRemovePrevRoute(
                  context, RouteConst.homeScreen)
              : Navigator.pop(context);
        },
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
