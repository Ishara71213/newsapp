import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/config/routes/route_const.dart';
import 'package:newsapp/config/theme/Bloc/bloc/theme_bloc.dart';
import 'package:newsapp/core/components/app_bar_with_back_btn.dart';
import 'package:newsapp/core/utils/navigation_handler.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkTheme = false;
  late ThemeBloc themeBloc;

  @override
  void initState() {
    super.initState();
    themeBloc = BlocProvider.of<ThemeBloc>(context);
    isDarkTheme = themeBloc.isDarkTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackBtn(
        title: "Settings",
        backHomeWithRefresh: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 90),
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceVariant),
                color: Theme.of(context).colorScheme.background,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      NavigationHandler.navigate(
                          context, RouteConst.savedNewsScreen)
                    },
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                        'assets/icons/save.svg',
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.tertiary,
                            BlendMode.srcIn),
                      ),
                      title: Text(
                        'Saved Posts',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: IconButton(
                        icon: svgKeyboardArrowRight,
                        focusColor: Theme.of(context).colorScheme.tertiary,
                        onPressed: () {
                          NavigationHandler.navigate(
                              context, RouteConst.savedNewsScreen);
                        },
                      ),
                    ),
                  ),
                  divider(),
                  GestureDetector(
                    onTap: () {
                      NavigationHandler.navigate(
                          context, RouteConst.filterScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        dense: true,
                        leading: SvgPicture.asset(
                          'assets/icons/theme.svg',
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.tertiary,
                              BlendMode.srcIn),
                        ),
                        title: Text(
                          'Dark Mode',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: Switch(
                            activeTrackColor:
                                Theme.of(context).colorScheme.primary,
                            inactiveThumbColor:
                                Theme.of(context).colorScheme.tertiary,
                            inactiveTrackColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            value: isDarkTheme,
                            onChanged: (value) => {
                                  setState(() {
                                    isDarkTheme = value;
                                  }),
                                  themeBloc.add(ThemeChanged(isDarkTheme))
                                }),
                      ),
                    ),
                  ),
                  divider(),
                  GestureDetector(
                    onTap: () => {
                      NavigationHandler.navigate(
                          context, RouteConst.filterScreen)
                    },
                    child: ListTile(
                      dense: true,
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: SvgPicture.asset(
                          'assets/icons/info.svg',
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.tertiary,
                              BlendMode.srcIn),
                        ),
                      ),
                      title: Text(
                        "Info",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: IconButton(
                        icon: svgKeyboardArrowRight,
                        onPressed: () {
                          NavigationHandler.navigate(
                              context, RouteConst.filterScreen);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Divider(
        color: Theme.of(context).colorScheme.surfaceVariant,
        indent: 10,
        endIndent: 10,
      ),
    );
  }

  final svgKeyboardArrowRight = SvgPicture.asset('assets/icons/arrowBack.svg');
}
