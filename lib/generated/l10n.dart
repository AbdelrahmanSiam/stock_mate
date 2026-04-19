// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `StockMate`
  String get appName {
    return Intl.message('StockMate', name: 'appName', desc: '', args: []);
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `PREMIUM INVENTORY & SALES`
  String get appTagline {
    return Intl.message(
      'PREMIUM INVENTORY & SALES',
      name: 'appTagline',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to manage your inventory`
  String get loginTagline {
    return Intl.message(
      'Sign in to manage your inventory',
      name: 'loginTagline',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get signInButton {
    return Intl.message('SIGN IN', name: 'signInButton', desc: '', args: []);
  }

  /// `Email address`
  String get email {
    return Intl.message('Email address', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get invalidPassword {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get invalidCredentials {
    return Intl.message(
      'Invalid email or password',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Check your connection`
  String get checkConnection {
    return Intl.message(
      'Check your connection',
      name: 'checkConnection',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get haveNoAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'haveNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register here`
  String get registerHere {
    return Intl.message(
      'Register here',
      name: 'registerHere',
      desc: '',
      args: [],
    );
  }

  /// `REGISTER`
  String get registerButton {
    return Intl.message('REGISTER', name: 'registerButton', desc: '', args: []);
  }

  /// `OR CONTINUE WITH`
  String get orContactWith {
    return Intl.message(
      'OR CONTINUE WITH',
      name: 'orContactWith',
      desc: '',
      args: [],
    );
  }

  /// `Forget?`
  String get forget {
    return Intl.message('Forget?', name: 'forget', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Set up your shop and admin account`
  String get registerTagline {
    return Intl.message(
      'Set up your shop and admin account',
      name: 'registerTagline',
      desc: '',
      args: [],
    );
  }

  /// `Do you already have an account? `
  String get haveAccount {
    return Intl.message(
      'Do you already have an account? ',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Shop Name`
  String get shopeName {
    return Intl.message('Shop Name', name: 'shopeName', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Abdelrahman Ahmed`
  String get fullNameExample {
    return Intl.message(
      'Abdelrahman Ahmed',
      name: 'fullNameExample',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Al-Barakah`
  String get shopNameExample {
    return Intl.message(
      'e.g. Al-Barakah',
      name: 'shopNameExample',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgetPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a email to reset your password. Don't forget to check your spam folder.`
  String get forgetPasswordTagline {
    return Intl.message(
      'Enter your email address and we will send you a email to reset your password. Don\'t forget to check your spam folder.',
      name: 'forgetPasswordTagline',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get sendResetLink {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Email`
  String get verifyYourEmail {
    return Intl.message(
      'Verify Your Email',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification link sent successfully`
  String get emailVerified {
    return Intl.message(
      'Email Verification link sent successfully',
      name: 'emailVerified',
      desc: '',
      args: [],
    );
  }

  /// `We've sent a verification link to`
  String get emailVerificationHeader1 {
    return Intl.message(
      'We\'ve sent a verification link to',
      name: 'emailVerificationHeader1',
      desc: '',
      args: [],
    );
  }

  /// `. Please click the link in your email to continue.`
  String get emailVerificationHeader2 {
    return Intl.message(
      '. Please click the link in your email to continue.',
      name: 'emailVerificationHeader2',
      desc: '',
      args: [],
    );
  }

  /// `Do not receive the email ?`
  String get resendEmailTagline {
    return Intl.message(
      'Do not receive the email ?',
      name: 'resendEmailTagline',
      desc: '',
      args: [],
    );
  }

  /// `RESEND LINK`
  String get resendEmailButton {
    return Intl.message(
      'RESEND LINK',
      name: 'resendEmailButton',
      desc: '',
      args: [],
    );
  }

  /// `StockMate Pro Tip`
  String get proTip {
    return Intl.message(
      'StockMate Pro Tip',
      name: 'proTip',
      desc: '',
      args: [],
    );
  }

  /// `Verifying your email ensures you receive automated stock-low alerts and daily sales summaries.`
  String get proTipTagline {
    return Intl.message(
      'Verifying your email ensures you receive automated stock-low alerts and daily sales summaries.',
      name: 'proTipTagline',
      desc: '',
      args: [],
    );
  }

  /// `Open Email App`
  String get openEmailApp {
    return Intl.message(
      'Open Email App',
      name: 'openEmailApp',
      desc: '',
      args: [],
    );
  }

  /// `Reset password link sent successfully`
  String get resetLinkSent {
    return Intl.message(
      'Reset password link sent successfully',
      name: 'resetLinkSent',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Google sign in cancelled`
  String get googleSigninCanceled {
    return Intl.message(
      'Google sign in cancelled',
      name: 'googleSigninCanceled',
      desc: '',
      args: [],
    );
  }

  /// `No account with this email`
  String get userNotFound {
    return Intl.message(
      'No account with this email',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get wrongPassword {
    return Intl.message(
      'Incorrect password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get invalidEmailFormat {
    return Intl.message(
      'Invalid email format',
      name: 'invalidEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts, try again later`
  String get tooManyRequests {
    return Intl.message(
      'Too many attempts, try again later',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection`
  String get networkError {
    return Intl.message(
      'Check your internet connection',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get unknownError {
    return Intl.message(
      'Something went wrong',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message('Alert', name: 'alert', desc: '', args: []);
  }

  /// `Low Stock`
  String get lowStock {
    return Intl.message('Low Stock', name: 'lowStock', desc: '', args: []);
  }

  /// `Monthly Revenue`
  String get monthlyRevenue {
    return Intl.message(
      'Monthly Revenue',
      name: 'monthlyRevenue',
      desc: '',
      args: [],
    );
  }

  /// `Today's Sales`
  String get todaySales {
    return Intl.message(
      'Today\'s Sales',
      name: 'todaySales',
      desc: '',
      args: [],
    );
  }

  /// `Total Products`
  String get totalProducts {
    return Intl.message(
      'Total Products',
      name: 'totalProducts',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
  }

  /// `Sales This Week`
  String get weeklySalesChartTitle {
    return Intl.message(
      'Sales This Week',
      name: 'weeklySalesChartTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fri-Sat`
  String get allDays {
    return Intl.message('Fri-Sat', name: 'allDays', desc: '', args: []);
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message('Yesterday', name: 'yesterday', desc: '', args: []);
  }

  /// ` days ago`
  String get daysAgo {
    return Intl.message(' days ago', name: 'daysAgo', desc: '', args: []);
  }

  /// `Recent Sales`
  String get recentSales {
    return Intl.message(
      'Recent Sales',
      name: 'recentSales',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// `No sales yet`
  String get noSalesYet {
    return Intl.message('No sales yet', name: 'noSalesYet', desc: '', args: []);
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Sales`
  String get sales {
    return Intl.message('Sales', name: 'sales', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Good Morning`
  String get morning {
    return Intl.message('Good Morning', name: 'morning', desc: '', args: []);
  }

  /// `Good Afternoon`
  String get afternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get evening {
    return Intl.message('Good Evening', name: 'evening', desc: '', args: []);
  }

  /// `Good Night`
  String get night {
    return Intl.message('Good Night', name: 'night', desc: '', args: []);
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `User's Shop`
  String get shop {
    return Intl.message('User\'s Shop', name: 'shop', desc: '', args: []);
  }

  /// `PM`
  String get PM {
    return Intl.message('PM', name: 'PM', desc: '', args: []);
  }

  /// `AM`
  String get AM {
    return Intl.message('AM', name: 'AM', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Search by name or barcode`
  String get searchByNameOrBarcode {
    return Intl.message(
      'Search by name or barcode',
      name: 'searchByNameOrBarcode',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Out of Stock`
  String get outOfStock {
    return Intl.message('Out of Stock', name: 'outOfStock', desc: '', args: []);
  }

  /// `IN STOCK`
  String get inStock {
    return Intl.message('IN STOCK', name: 'inStock', desc: '', args: []);
  }

  /// `LOW`
  String get low {
    return Intl.message('LOW', name: 'low', desc: '', args: []);
  }

  /// `OUT`
  String get out {
    return Intl.message('OUT', name: 'out', desc: '', args: []);
  }

  /// `No products found`
  String get noProductsFound {
    return Intl.message(
      'No products found',
      name: 'noProductsFound',
      desc: '',
      args: [],
    );
  }

  /// `Try searching with a different keyword`
  String get noProductsFoundSubtitle {
    return Intl.message(
      'Try searching with a different keyword',
      name: 'noProductsFoundSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get addProduct {
    return Intl.message('Add Product', name: 'addProduct', desc: '', args: []);
  }

  /// `Edit Product`
  String get editProduct {
    return Intl.message(
      'Edit Product',
      name: 'editProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Enter product name`
  String get productNameHint {
    return Intl.message(
      'Enter product name',
      name: 'productNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Barcode`
  String get barcode {
    return Intl.message('Barcode', name: 'barcode', desc: '', args: []);
  }

  /// `Scan or enter barcode`
  String get barcodeHint {
    return Intl.message(
      'Scan or enter barcode',
      name: 'barcodeHint',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `e.g. Electronics, Food`
  String get categoryHint {
    return Intl.message(
      'e.g. Electronics, Food',
      name: 'categoryHint',
      desc: '',
      args: [],
    );
  }

  /// `Buy Price`
  String get buyPrice {
    return Intl.message('Buy Price', name: 'buyPrice', desc: '', args: []);
  }

  /// `Sell Price`
  String get sellPrice {
    return Intl.message('Sell Price', name: 'sellPrice', desc: '', args: []);
  }

  /// `Initial Quantity`
  String get initialQuantity {
    return Intl.message(
      'Initial Quantity',
      name: 'initialQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Low Stock Alert`
  String get lowStockAlert {
    return Intl.message(
      'Low Stock Alert',
      name: 'lowStockAlert',
      desc: '',
      args: [],
    );
  }

  /// `ESTIMATED PROFIT`
  String get estimatedProfit {
    return Intl.message(
      'ESTIMATED PROFIT',
      name: 'estimatedProfit',
      desc: '',
      args: [],
    );
  }

  /// `SAVE PRODUCT`
  String get saveProduct {
    return Intl.message(
      'SAVE PRODUCT',
      name: 'saveProduct',
      desc: '',
      args: [],
    );
  }

  /// `ADD PHOTO`
  String get addPhoto {
    return Intl.message('ADD PHOTO', name: 'addPhoto', desc: '', args: []);
  }

  /// `Delete Product`
  String get deleteProduct {
    return Intl.message(
      'Delete Product',
      name: 'deleteProduct',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this product?`
  String get deleteProductConfirm {
    return Intl.message(
      'Are you sure you want to delete this product?',
      name: 'deleteProductConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Selling at a loss!`
  String get sellingAtLoss {
    return Intl.message(
      'Selling at a loss!',
      name: 'sellingAtLoss',
      desc: '',
      args: [],
    );
  }

  /// `Product saved successfully`
  String get productSavedSuccess {
    return Intl.message(
      'Product saved successfully',
      name: 'productSavedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Product deleted successfully`
  String get productDeletedSuccess {
    return Intl.message(
      'Product deleted successfully',
      name: 'productDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload image`
  String get imageUploadError {
    return Intl.message(
      'Failed to upload image',
      name: 'imageUploadError',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Product saved successfully`
  String get productSaved {
    return Intl.message(
      'Product saved successfully',
      name: 'productSaved',
      desc: '',
      args: [],
    );
  }

  /// `Product deleted successfully`
  String get productDeleted {
    return Intl.message(
      'Product deleted successfully',
      name: 'productDeleted',
      desc: '',
      args: [],
    );
  }

  /// `No products yet`
  String get noProductsYet {
    return Intl.message(
      'No products yet',
      name: 'noProductsYet',
      desc: '',
      args: [],
    );
  }

  /// `Tap + to add your first product`
  String get noProductsYetSubtitle {
    return Intl.message(
      'Tap + to add your first product',
      name: 'noProductsYetSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No results for this search`
  String get noSearchResults {
    return Intl.message(
      'No results for this search',
      name: 'noSearchResults',
      desc: '',
      args: [],
    );
  }

  /// `Scan Barcode`
  String get scanBarcode {
    return Intl.message(
      'Scan Barcode',
      name: 'scanBarcode',
      desc: '',
      args: [],
    );
  }

  /// `Point at product barcode`
  String get pointAtProductBarcode {
    return Intl.message(
      'Point at product barcode',
      name: 'pointAtProductBarcode',
      desc: '',
      args: [],
    );
  }

  /// `Point at barcode to search`
  String get pointAtBarcodeToSearch {
    return Intl.message(
      'Point at barcode to search',
      name: 'pointAtBarcodeToSearch',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
