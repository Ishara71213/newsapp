import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBackBtn(
        title: "Settings",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 90),
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: const Color.fromARGB(137, 175, 175, 175)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {
                      NavigationHandler.navigate(
                          context, RouteConst.filterScreen)
                    },
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset('assets/icons/save.svg'),
                      title: Text(
                        'Saved Posts',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
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
                        leading: SvgPicture.asset('assets/icons/theme.svg'),
                        title: Text(
                          'Dark Mode',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
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
                      leading: SvgPicture.asset('assets/icons/info.svg'),
                      title: Text(
                        "Info",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      child: Divider(
        color: Color.fromARGB(255, 228, 228, 228),
        indent: 10,
        endIndent: 10,
      ),
    );
  }

  final svgKeyboardArrowRight = SvgPicture.asset('assets/icons/arrowBack.svg');
}
