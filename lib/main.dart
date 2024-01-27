import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/config/routes/on_generate_route.dart';
import 'package:newsapp/config/routes/route_const.dart';
import 'package:newsapp/config/theme/Bloc/bloc/theme_bloc.dart';
import 'package:newsapp/config/theme/app_theme.dart';
import 'package:newsapp/core/utils/di_container.dart' as di;
import 'package:newsapp/features/News/presentation/filter_screen/bloc/cubit/filter_cubit.dart';
import 'package:newsapp/features/News/presentation/home_screen/bloc/cubit/home_cubit.dart';
import 'package:newsapp/features/News/presentation/saved_news/bloc/cubit/saved_news_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (_) => di.sl<ThemeBloc>()),
        BlocProvider<HomeCubit>(create: (_) => di.sl<HomeCubit>()),
        BlocProvider<SavedNewsCubit>(create: (_) => di.sl<SavedNewsCubit>()),
        BlocProvider<FilterCubit>(create: (_) => di.sl<FilterCubit>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'CNN News',
            debugShowCheckedModeBanner: false,
            theme: appThemeData[AppTheme.light],
            darkTheme: appThemeData[AppTheme.dark],
            initialRoute: RouteConst.homeScreen,
            onGenerateRoute: OnGenerateRoute.route,
            themeMode: state,
            home: null,
          );
        },
      ),
    );
  }
}
