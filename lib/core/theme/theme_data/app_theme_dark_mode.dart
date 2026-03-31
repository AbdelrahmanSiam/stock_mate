import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

abstract class AppThemeDarkMode {

  static ThemeData getDarkTheme() => ThemeData(
        // ── General ───────────────────────────────────────
        brightness: Brightness.dark,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColorsDarkMode.background,
        primaryColor: AppColorsDarkMode.primary,

        // ── ColorScheme ───────────────────────────────────
        // colorScheme is the main for all widgets
        colorScheme: const ColorScheme.dark(
          primary: AppColorsDarkMode.primary,
          secondary: AppColorsDarkMode.secondary,
          surface: AppColorsDarkMode.surface,
          error: AppColorsDarkMode.error,
          onPrimary: AppColorsDarkMode.textPrimary,
          onSecondary: AppColorsDarkMode.textPrimary,
          onSurface: AppColorsDarkMode.textPrimary,
          onError: AppColorsDarkMode.textPrimary,
        ),

        // ── AppBar ────────────────────────────────────────
        // transparent without shadow
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColorsDarkMode.textPrimary,
            fontFamily: 'Inter',
          ),
          iconTheme: IconThemeData(color: AppColorsDarkMode.textPrimary),
          systemOverlayStyle: SystemUiOverlayStyle(
            // status bar over screen
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            // navigation bar under screen
            systemNavigationBarColor: AppColorsDarkMode.background,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),

        // ── ElevatedButton ────────────────────────────────
        // default ElevatedButton style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorsDarkMode.primary,
            foregroundColor: AppColorsDarkMode.textPrimary,
            disabledBackgroundColor: AppColorsDarkMode.border,
            disabledForegroundColor: AppColorsDarkMode.textSecondary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            minimumSize: const Size(double.infinity, 52),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
        ),

        // ── OutlinedButton ────────────────────────────────
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColorsDarkMode.primary,
            side: const BorderSide(color: AppColorsDarkMode.primary, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            minimumSize: const Size(double.infinity, 52),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
        ),

        // ── TextButton ────────────────────────────────────
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColorsDarkMode.primary,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
        ),

        // ── InputDecoration (TextFields) ──────────────────
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColorsDarkMode.surface,
          prefixIconColor: AppColorsDarkMode.textSecondary,
          suffixIconColor: AppColorsDarkMode.textSecondary,
          hintStyle: const TextStyle(
            color: AppColorsDarkMode.textSecondary,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          // default Border 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColorsDarkMode.border,
              width: 1,
            ),
          ),
          // focused field
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColorsDarkMode.primary,
              width: 1.5,
            ),
          ),
          // error style
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColorsDarkMode.error,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColorsDarkMode.error,
              width: 1.5,
            ),
          ),
          errorStyle: const TextStyle(
            color: AppColorsDarkMode.error,
            fontSize: 11,
            fontFamily: 'Inter',
          ),
        ),

        // ── Card ──────────────────────────────────────────
        cardTheme: CardThemeData(
          color: AppColorsDarkMode.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: AppColorsDarkMode.border,
              width: 1,
            ),
          ),
          margin: EdgeInsets.zero,
        ),

        // ── BottomNavigationBar ───────────────────────────
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColorsDarkMode.surface,
          selectedItemColor: AppColorsDarkMode.primary,
          unselectedItemColor: AppColorsDarkMode.textSecondary,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
            fontFamily: 'Inter',
          ),
        ),

        // ── SnackBar ──────────────────────────────────────
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColorsDarkMode.surface,
          contentTextStyle: const TextStyle(
            color: AppColorsDarkMode.textPrimary,
            fontSize: 13,
            fontFamily: 'Inter',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
        ),

        // ── Divider ───────────────────────────────────────
        dividerTheme: const DividerThemeData(
          color: AppColorsDarkMode.border,
          thickness: 1,
          space: 1,
        ),

        // ── ProgressIndicator ─────────────────────────────
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColorsDarkMode.primary,
        ),
      );
}