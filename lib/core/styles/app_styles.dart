import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  final double width = MediaQuery.sizeOf(context).width;

  final double scaleFactor = width / 360;

  final double responsiveFontSize = fontSize * scaleFactor;

  return responsiveFontSize.clamp(fontSize * 0.8, fontSize * 1.2);
}

abstract class AppStyles {
  // ── Splash ───────────────────────────────────────────────
  // AppName into splash screen
  static TextStyle appNameBold32(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 32),
    fontWeight: FontWeight.w700,
    color: AppColorsDarkMode.textPrimary,
    letterSpacing: 1.2,
    fontFamily: 'Inter',
  );

  // tagline under app name "PREMIUM INVENTORY & SALES"
  static TextStyle taglineRegular11(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 11),
    fontWeight: FontWeight.w400,
    color: AppColorsDarkMode.textSecondary,
    letterSpacing: 3.0,
    fontFamily: 'Inter',
  );

  // splash "VERSION" و "ENTERPRISE SECURE"
  static TextStyle captionRegular10(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 10),
    fontWeight: FontWeight.w400,
    color: AppColorsDarkMode.textSecondary,
    letterSpacing: 1.5,
    fontFamily: 'Inter',
  );

  // ── Headlines ─────────────────────────────────────────────
  static TextStyle h1Bold28(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 28),
    fontWeight: FontWeight.w700,
    color: AppColorsDarkMode.textPrimary,
    fontFamily: 'Inter',
  );

  static TextStyle h2Bold22(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 22),
    fontWeight: FontWeight.w700,
    color: AppColorsDarkMode.textPrimary,
    fontFamily: 'Inter',
  );

  // ── Body ──────────────────────────────────────────────────
  // card content and descriptions
  static TextStyle bodyMediumRegular14(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: FontWeight.w400,
    color: AppColorsDarkMode.textPrimary,
    fontFamily: 'Inter',
  );

  //  hints and sublabels
  static TextStyle bodySmallRegular12(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 12),
    fontWeight: FontWeight.w400,
    color: AppColorsDarkMode.textSecondary,
    fontFamily: 'Inter',
  );

  // ── Labels ────────────────────────────────────────────────
  // form field labels
  static TextStyle labelSemiBold13(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 13),
    fontWeight: FontWeight.w600,
    color: AppColorsDarkMode.textPrimary,
    fontFamily: 'Inter',
  );

  // ── Prices & Values ───────────────────────────────────────
  // product prices and totals in Reports
  static TextStyle priceBold16(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w700,
    color: AppColorsDarkMode.primary,
    fontFamily: 'Inter',
  );

  // dashboard summary cards (Large numbers)
  static TextStyle statValueBold24(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 24),
    fontWeight: FontWeight.w700,
    color: AppColorsDarkMode.textPrimary,
    fontFamily: 'Inter',
  );

  // ── Buttons ───────────────────────────────────────────────
  static TextStyle buttonSemiBold15(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 15),
    fontWeight: FontWeight.w600,
    color: AppColorsDarkMode.textPrimary,
    fontFamily: 'Inter',
  );

  // ── Error ─────────────────────────────────────────────────
  // validation under fields
  static TextStyle errorTextRegular11(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 11),
    fontWeight: FontWeight.w400,
    color: AppColorsDarkMode.error,
    fontFamily: 'Inter',
  );

  // ── Section Titles ────────────────────────────────────────
  // Like "Sales This Week" in dashboard
  static TextStyle sectionTitleSemiBold16(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w600,
    color: AppColorsDarkMode.textPrimary,
    fontFamily: 'Inter',
  );

  // ── Card Title ────────────────────────────────────────────
  // Product name in product card
  static TextStyle cardTitleSemiBold14(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: FontWeight.w600,
    color: AppColorsDarkMode.textPrimary,
    fontFamily: 'Inter',
  );
}
