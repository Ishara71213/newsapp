import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/config/routes/route_const.dart';
import 'package:newsapp/config/theme/Bloc/bloc/theme_bloc.dart';
import 'package:newsapp/core/components/search_bar_prefsize_widget.dart';
import 'package:newsapp/core/utils/navigation_handler.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const CustomAppBar({super.key, this.appBarTitle = ""});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(150.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: widget.appBarTitle != ""
            ? Text(widget.appBarTitle)
            : BlocProvider.of<ThemeBloc>(context).isDarkTheme
                ? SvgPicture.asset(
                    'assets/icons/logo-on-dark.svg',
                    height: 45,
                  )
                : SvgPicture.asset(
                    'assets/icons/logo-on-light.svg',
                    height: 45,
                  ),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        elevation: 0,
        leadingWidth: 70,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              radius: 32.0,
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/icons/filter.svg',
                  height: 28,
                ),
              ),
            ),
          ),
          onTap: () {
            NavigationHandler.navigate(context, RouteConst.filterScreen);
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            icon: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(38)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  height: 28,
                ),
              ),
            ),
            onPressed: () {
              NavigationHandler.navigate(context, RouteConst.settingsScreen);
            },
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
          )
        ],
        bottom: const SearchBarPrefSizeWidget());
  }
}
