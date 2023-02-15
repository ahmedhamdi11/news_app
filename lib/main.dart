import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/style/dark_theme.dart';
import 'package:news_app/shared/style/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences shared = await SharedPreferences.getInstance();
  bool? isDarkTheme = shared.getBool('isDarkTheme');
  print(isDarkTheme);
  runApp(MyApp(isDark: isDarkTheme));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()
          ..changeTheme(fromShared: isDark)
          ..getBusinessData(),
        child: BlocConsumer<AppCubit, CubitStates>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
            title: 'News App',
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: AppCubit.get(context).isDarkTheme
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const HomeLayout(),
          ),
        ));
  }
}
