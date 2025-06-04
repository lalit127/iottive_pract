import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iottive_pract/config/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

/// --- Events ---
abstract class StatusBarEvent {}

class ChangeStatusBarColor extends StatusBarEvent {
  final String pageTitle;

  ChangeStatusBarColor(this.pageTitle);
}

class ChangeThemeMode extends StatusBarEvent {
  final bool isDark;

  ChangeThemeMode(this.isDark);
}

class InitializeThemeMode extends StatusBarEvent {
  final Brightness brightness;
  InitializeThemeMode(this.brightness);
}

/// --- State ---
class StatusBarState {
  final Color statusBarColor;
  final Brightness statusBarIconBrightness;
  final ThemeMode themeMode;

  StatusBarState({
    required this.statusBarColor,
    required this.statusBarIconBrightness,
    required this.themeMode,
  });

  StatusBarState copyWith({
    Color? statusBarColor,
    Brightness? statusBarIconBrightness,
    ThemeMode? themeMode,
  }) {
    return StatusBarState(
      statusBarColor: statusBarColor ?? this.statusBarColor,
      statusBarIconBrightness:
          statusBarIconBrightness ?? this.statusBarIconBrightness,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

@injectable
class StatusBarBloc extends Bloc<StatusBarEvent, StatusBarState> {
  StatusBarBloc()
    : super(
        StatusBarState(
          statusBarColor: AppColors.backgroundLight,
          statusBarIconBrightness: Brightness.dark,
          themeMode: ThemeMode.light,
        ),
      ) {
    on<ChangeStatusBarColor>(_onChangeStatusBarColor);
    on<ChangeThemeMode>(_onChangeThemeMode);
    on<InitializeThemeMode>(_onInitializeThemeMode);
  }

  Future<void> _onInitializeThemeMode(
    InitializeThemeMode event,
    Emitter<StatusBarState> emit,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('darkMode');

      ThemeMode mode;
      if (isDark == null) {
        mode =
            event.brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light;
      } else {
        mode = isDark ? ThemeMode.dark : ThemeMode.light;
      }

      emit(state.copyWith(themeMode: mode));
    } catch (e) {
      print("Error initializing theme mode: $e");
    }
  }

  Future<void> _onChangeStatusBarColor(
    ChangeStatusBarColor event,
    Emitter<StatusBarState> emit,
  ) async {
    if (Platform.isAndroid) {
      Color newColor;
      Brightness iconBrightness;

      newColor = AppColors.whiteOff;
      iconBrightness = Brightness.dark;

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: newColor,
          statusBarIconBrightness: iconBrightness,
        ),
      );

      emit(
        state.copyWith(
          statusBarColor: newColor,
          statusBarIconBrightness: iconBrightness,
        ),
      );
    }
  }

  Future<void> _onChangeThemeMode(
    ChangeThemeMode event,
    Emitter<StatusBarState> emit,
  ) async {
    final theme = event.isDark ? ThemeMode.dark : ThemeMode.light;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('darkMode', event.isDark);
    } catch (error) {
      print("Error saving theme mode: $error");
    }

    emit(state.copyWith(themeMode: theme));
  }

  VoidCallback onBackPress(BuildContext context, String pageTitle) {
    return () {
      add(ChangeStatusBarColor(pageTitle));
      GoRouter.of(context).pop();
    };
  }
}
