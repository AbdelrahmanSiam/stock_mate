import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/di/service_locator.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:stock_mate/features/auth/presentation/views/email_verification_view.dart';
import 'package:stock_mate/features/auth/presentation/views/forget_password_view.dart';
import 'package:stock_mate/features/auth/presentation/views/register_view.dart';
import 'package:stock_mate/features/barcode_scanner/presentation/views/barcode_scanner_view.dart';
import 'package:stock_mate/features/dashboard/presentation/manager/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:stock_mate/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:stock_mate/features/language/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:stock_mate/features/language/presentation/views/language_view.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/add_edit_product_cubit/add_edit_product_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/add_product_view.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_detail_cubit/sale_detail_cubit.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sales_history_cubit/sales_history_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/new_sale_view.dart';
import 'package:stock_mate/features/sales/presentation/views/sale_details_view.dart';
import 'package:stock_mate/features/sales/presentation/views/sale_success_view.dart';
import 'package:stock_mate/features/sales/presentation/views/sales_history_view.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/invalid-sale_id.dart';
import 'package:stock_mate/features/splash/presentation/manager/cubits/splash_cubit/splash_cubit.dart';
import 'package:stock_mate/features/splash/presentation/views/splash_view.dart';
import 'package:stock_mate/features/auth/presentation/views/login_view.dart';

// ── Route Names ──────────────────────────────────────────────
abstract class AppRoutes {
  static const String splash = '/';
  static const String language = '/language';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';
  static const String emailVerification = '/emailVerification';
  static const String dashboard = '/dashboard';
  static const String addEditProducts = '/addEditProducts';
  static const String barcodeScanner = '/barcode-scanner';
  static const String newSale = '/new-sale';
  static const String saleSuccess = '/sale-success';
  static const String salesHistory = '/sales-history';
  static const String saleDetails = '/sale-details';
}

// ── Router Instance ───────────────────────────────────────────
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<SplashCubit>(),
        child: const SplashView(),
      ),
    ),

    GoRoute(
      path: AppRoutes.language,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<LanguageCubit>(),
        child: const LanguageView(),
      ),
    ),

    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const RegisterView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.forgetPassword,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const ForgetPasswordView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.emailVerification,
      builder: (context, state) {
        final enteredEmail = state.extra as String;
        return BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: EmailVerificationView(enteredEmail: enteredEmail),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.dashboard,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<DashboardCubit>(),
        child: const DashboardView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.addEditProducts,
      builder: (context, state) {
        final product = state.extra as ProductEntity?;
        return BlocProvider(
          create: (context) => getIt<AddEditProductCubit>(),
          child: AddProductView(product: product),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.barcodeScanner,
      builder: (context, state) {
        final scanContext = state.extra as String? ?? "search";
        return BarcodeScannerView(scanContext: scanContext);
      },
    ),
    GoRoute(
      path: AppRoutes.newSale,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<SaleCubit>(),
          child: NewSaleView(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.saleSuccess,
      builder: (context, state) {
        final sale = state.extra as SaleEntity;
        return SaleSuccessView(sale: sale);
      },
    ),
    GoRoute(
      path: AppRoutes.salesHistory,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<SalesHistoryCubit>(),
        child: const SalesHistoryView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.saleDetails,
      builder: (context, state) {
        final saleId = state.extra;

        if (saleId is! String) {
          return InvalidSaleId();
        }
        return BlocProvider(
          create: (_) => getIt<SaleDetailCubit>(),
          child: SaleDetailsView(saleId: saleId),
        );
      },
    ),
  ],
);
