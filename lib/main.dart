import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iottive_pract/blocs/auth/auth_bloc.dart';
import 'package:iottive_pract/blocs/connectivity/connectivity_bloc.dart';
import 'package:iottive_pract/blocs/home/home_bloc.dart';
import 'package:iottive_pract/blocs/status_bar_bloc.dart';
import 'package:iottive_pract/common/theme.dart';
import 'package:iottive_pract/locator.dart';
import 'package:iottive_pract/screens/auth/login_screen.dart';
import 'package:iottive_pract/utils/app_routes.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StatusBarBloc>(
          create: (context) => getIt<StatusBarBloc>(),
        ),
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        BlocProvider<HomeBloc>(create: (context) => getIt<HomeBloc>()),
        BlocProvider<ConnectivityBloc>(
          create: (context) => getIt<ConnectivityBloc>(),
        ),
      ],
      child: BlocBuilder<StatusBarBloc, StatusBarState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Iottive App',
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            routerConfig: router,
            builder: (context, child) {
              final brightness = MediaQuery.platformBrightnessOf(context);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.read<StatusBarBloc>().add(
                  InitializeThemeMode(brightness),
                );
              });
              return child!;
            },
          );
        },
      ),
    );
  }
}
