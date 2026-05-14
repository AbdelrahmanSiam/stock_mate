import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/core/cubit/cubit/locale_cubit.dart';
import 'package:stock_mate/core/services/notification_service.dart';
import 'package:stock_mate/core/services/notification_service_impl.dart';
import 'package:stock_mate/features/auth/data/data_sources/remote/auth_remote_datasource.dart';
import 'package:stock_mate/features/auth/data/data_sources/remote/auth_remote_datasource_impl.dart';
import 'package:stock_mate/features/auth/data/repo/auth_repository_impl.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';
import 'package:stock_mate/features/auth/domain/use_cases/check_email_verified_usecase/check_email_verified_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/register_use_case/register_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_email_verification_usecase/send_email_verification_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_password_reset_usecase/send_password_reset_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/get_current_user_use_case/get_current_user_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/sign_in_with_google_use_case/sign_in_with_google_use_case.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:stock_mate/features/dashboard/data/data_sources/dashboard_remote_datasource.dart';
import 'package:stock_mate/features/dashboard/data/data_sources/dashboard_remote_datasource_impl.dart';
import 'package:stock_mate/features/dashboard/data/repo/dashboard_repository_impl.dart';
import 'package:stock_mate/features/dashboard/domain/repo/dashboard_repository.dart';
import 'package:stock_mate/features/dashboard/domain/use_case/get_dashboard_usecase.dart';
import 'package:stock_mate/features/dashboard/presentation/manager/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:stock_mate/features/language/data/local/language_local_data.dart';
import 'package:stock_mate/features/language/data/local/language_local_data_impl.dart';
import 'package:stock_mate/features/language/data/repo/language_repo_impl.dart';
import 'package:stock_mate/features/language/domain/repo/language_repo.dart';
import 'package:stock_mate/features/language/domain/usecases/get_saved_language_use_case.dart';
import 'package:stock_mate/features/language/domain/usecases/save_language_use_case.dart';
import 'package:stock_mate/features/language/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:stock_mate/features/products/data/data_sources/remote/product_image_datasource/product_image_datasource.dart';
import 'package:stock_mate/features/products/data/data_sources/remote/product_image_datasource/product_image_datasource_impl.dart';
import 'package:stock_mate/features/products/data/data_sources/remote/product_remote_datasource/product_remote_datasource.dart';
import 'package:stock_mate/features/products/data/data_sources/remote/product_remote_datasource/product_remote_datasource_impl.dart';
import 'package:stock_mate/features/products/data/repo/product_repository_impl.dart';
import 'package:stock_mate/features/products/domain/repo/product_repository.dart';
import 'package:stock_mate/features/products/domain/use_cases/add_product_use_case/add_product_use_case.dart';
import 'package:stock_mate/features/products/domain/use_cases/delete_product_image_use_case/delete_product_image_usecase.dart';
import 'package:stock_mate/features/products/domain/use_cases/delete_product_use_case/delete_product_use_case.dart';
import 'package:stock_mate/features/products/domain/use_cases/get_products_use_case/get_products_use_case.dart';
import 'package:stock_mate/features/products/domain/use_cases/update_product_use_case/update_product_usecase.dart';
import 'package:stock_mate/features/products/domain/use_cases/upload_product_image_use_case/upload_product_image_use_case.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/add_edit_product_cubit/add_edit_product_cubit.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:stock_mate/features/sales/data/data_source/remote/sale_remote_datasource/sale_remote_datasource.dart';
import 'package:stock_mate/features/sales/data/data_source/remote/sale_remote_datasource/sale_remote_datasource_impl.dart';
import 'package:stock_mate/features/sales/data/repo/sale_repository_impl.dart';
import 'package:stock_mate/features/sales/domain/repo/sale_repository.dart';
import 'package:stock_mate/features/sales/domain/use_case/create_sale_use_case/create_sale_use_case.dart';
import 'package:stock_mate/features/sales/domain/use_case/get_recent_sales_use_case/get_recent_sales_use_case.dart';
import 'package:stock_mate/features/sales/domain/use_case/get_sale_by_id_use_case/get_sale_by_id_use_case.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_detail_cubit/sale_detail_cubit.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sales_history_cubit/sales_history_cubit.dart';
import 'package:stock_mate/features/settings/data/data_sources/remote/settings_remote_datasource.dart';
import 'package:stock_mate/features/settings/data/data_sources/remote/settings_remote_datasource_impl.dart';
import 'package:stock_mate/features/settings/data/repo/settings_repository_impl.dart';
import 'package:stock_mate/features/settings/domain/repo/settings_repository.dart';
import 'package:stock_mate/features/settings/domain/use_cases/get_user_data_use_case/get_user_data_use_case.dart';
import 'package:stock_mate/features/settings/domain/use_cases/logout_use_case/logout_use_case.dart';
import 'package:stock_mate/features/settings/domain/use_cases/update_display_name_use_case/update_display_name_use_case.dart';
import 'package:stock_mate/features/settings/domain/use_cases/update_shop_name_use_case/update_shop_name_use_case.dart';
import 'package:stock_mate/features/settings/domain/use_cases/upload_shop_logo_use_case/upload_shop_logo_use_case.dart';
import 'package:stock_mate/features/settings/domain/use_cases/upload_shop_logo_url_use_case/upload_shop_logo_url_use_case.dart';
import 'package:stock_mate/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:stock_mate/features/splash/data/datasources/remote/splash_remote_datasource.dart';
import 'package:stock_mate/features/splash/data/datasources/remote/splash_remote_datasource_impl.dart';
import 'package:stock_mate/features/splash/data/repo/splash_repo_impl.dart';
import 'package:stock_mate/features/splash/domain/usecase/check_auth_use_case.dart';
import 'package:stock_mate/features/splash/presentation/manager/cubits/splash_cubit/splash_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //                                    Splash Feature

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  getIt.registerLazySingleton<SplashRemoteDatasource>(
    () => SplashRemoteDatasourceImpl(getIt<FirebaseAuth>()),
  );
  getIt.registerLazySingleton<SplashRepoImpl>(
    () =>
        SplashRepoImpl(splashRemoteDatasource: getIt<SplashRemoteDatasource>()),
  );
  getIt.registerLazySingleton<CheckAuthUseCase>(
    () => CheckAuthUseCase(splashRepo: getIt<SplashRepoImpl>()),
  );
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<CheckAuthUseCase>()),
  );

  //                                         Language Feature

  // ── Hive Box ──────────────────────────────────────────
  getIt.registerLazySingleton<Box>(
    () => Hive.box(kLanguageBox),
    instanceName: kLanguageInstanceName,
  );

  // ── Language DataSources ───────────────────────────────
  getIt.registerLazySingleton<LanguageLocalData>(
    () => LanguageLocalDataImpl(
      box: getIt<Box>(instanceName: kLanguageInstanceName),
    ),
  );

  // ── Language Repository ────────────────────────────────
  getIt.registerLazySingleton<LanguageRepo>(
    () => LanguageRepoImpl(languageLocalData: getIt<LanguageLocalData>()),
  );

  // ── Language UseCases ──────────────────────────────────
  getIt.registerLazySingleton<SaveLanguageUseCase>(
    () => SaveLanguageUseCase(languageRepo: getIt<LanguageRepo>()),
  );

  getIt.registerLazySingleton<GetSavedLanguageUseCase>(
    () => GetSavedLanguageUseCase(languageRepo: getIt<LanguageRepo>()),
  );
  // ── Local Cubit ─────────────────────────────────────
  getIt.registerLazySingleton<LocaleCubit>(
    () => LocaleCubit(
      getIt<SaveLanguageUseCase>(),
      getIt<GetSavedLanguageUseCase>(),
    ),
  );

  // ── Language Cubit ─────────────────────────────────────
  getIt.registerFactory<LanguageCubit>(
    () => LanguageCubit(getIt<LocaleCubit>()),
  );

  //                                               other Auth Feature

  // ── Supabase ───────────────────────────────────────────────
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // ── Auth Remote DataSource ─────────────────────────────────
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDatasourceImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
    ),
  );

  // ── Auth Repository ────────────────────────────────────────
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  // ── Auth UseCases ──────────────────────────────────────────
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SendEmailVerificationUseCase>(
    () => SendEmailVerificationUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<CheckEmailVerifiedUseCase>(
    () => CheckEmailVerifiedUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SendPasswordResetUseCase>(
    () => SendPasswordResetUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(getIt<AuthRepository>()),
  );

  // ── Auth Cubit ─────────────────────────────────────────────
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      getIt<LoginUseCase>(),
      getIt<RegisterUseCase>(),
      getIt<SendEmailVerificationUseCase>(),
      getIt<CheckEmailVerifiedUseCase>(),
      getIt<SendPasswordResetUseCase>(),
      getIt<SignInWithGoogleUseCase>(),
      getIt<GetCurrentUserUseCase>(),
    ),
  );
  //                                   Notification service only on in the app
  getIt.registerLazySingleton<NotificationService>(
    () => NotificationServiceImpl(),
  );

  //                                         Dashboard Feature

  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      remoteDataSource: getIt<DashboardRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetDashboardUseCase>(
    () => GetDashboardUseCase(getIt<DashboardRepository>()),
  );
  getIt.registerFactory<DashboardCubit>(
    () => DashboardCubit(getDashboardUseCase: getIt<GetDashboardUseCase>()),
  );

  //                                         Add / Edit Product Feature

  // ── Product DataSources ────────────────────────────────────
  getIt.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(
      FirebaseFirestore.instance,
      getIt<NotificationService>(),
    ),
  );
  getIt.registerLazySingleton<ProductImageDataSource>(
    () => ProductImageDataSourceImpl(getIt<SupabaseClient>()),
  );
  // ── Product Repository ─────────────────────────────────────
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDatasource: getIt<ProductRemoteDatasource>(),
      productImageDataSource: getIt<ProductImageDataSource>(),
    ),
  );
  // ── Product UseCases ───────────────────────────────────────
  getIt.registerLazySingleton<AddProductUseCase>(
    () => AddProductUseCase(getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton<UpdateProductUseCase>(
    () => UpdateProductUseCase(getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton<DeleteProductUseCase>(
    () => DeleteProductUseCase(getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton<UploadProductImageUseCase>(
    () => UploadProductImageUseCase(getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton<DeleteProductImageUseCase>(
    () => DeleteProductImageUseCase(getIt<ProductRepository>()),
  );
  // ── AddEditProduct Cubit ───────────────────────────────────
  getIt.registerFactory<AddEditProductCubit>(
    () => AddEditProductCubit(
      getIt<AddProductUseCase>(),
      getIt<UploadProductImageUseCase>(),
      getIt<UpdateProductUseCase>(),
      getIt<DeleteProductImageUseCase>(),
      getIt<DeleteProductUseCase>(),
    ),
  );
  //                                          Products Feature
  // UseCases
  getIt.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(productRepository: getIt<ProductRepository>()),
  );

  // ProductCubit
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<GetProductsUseCase>()),
  );

  //                                                  Sale Feature
  getIt.registerLazySingleton<SaleRemoteDataSource>(
    () => SaleRemoteDatasourceImpl(
      FirebaseFirestore.instance,
      getIt<NotificationService>(),
    ),
  );
  getIt.registerLazySingleton<SaleRepository>(
    () => SaleRepositoryImpl(getIt<SaleRemoteDataSource>()),
  );
  getIt.registerLazySingleton<CreateSaleUseCase>(
    () => CreateSaleUseCase(repository: getIt<SaleRepository>()),
  );
  getIt.registerFactory<SaleCubit>(
    () => SaleCubit(getIt<CreateSaleUseCase>(), getIt<GetProductsUseCase>()),
  );
  // ── Sale UseCases ──────────────────────────────────────────
  getIt.registerLazySingleton<GetRecentSalesUseCase>(
    () => GetRecentSalesUseCase(repository: getIt<SaleRepository>()),
  );

  // ── SalesHistory Cubit ─────────────────────────────────────
  getIt.registerFactory<SalesHistoryCubit>(
    () => SalesHistoryCubit(getIt<GetRecentSalesUseCase>()),
  );

  //                                                 Sale Detail Feature
  getIt.registerLazySingleton<GetSaleByIdUseCase>(
    () => GetSaleByIdUseCase(getIt<SaleRepository>()),
  );

  getIt.registerFactory<SaleDetailCubit>(
    () => SaleDetailCubit(getIt<GetSaleByIdUseCase>()),
  );
  //                                                   Settings Feature
  getIt.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDatasourceImpl(
      firestore: FirebaseFirestore.instance,
      firebaseAuth: FirebaseAuth.instance,
      supabase: Supabase.instance.client,
      googleSignIn: GoogleSignIn(),
    ),
  );

  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(getIt<SettingsRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetUserDataUseCase>(
    () => GetUserDataUseCase(repository: getIt<SettingsRepository>()),
  );
  getIt.registerLazySingleton<UpdateShopNameUseCase>(
    () => UpdateShopNameUseCase(repository: getIt<SettingsRepository>()),
  );
  getIt.registerLazySingleton<UpdateDisplayNameUseCase>(
    () => UpdateDisplayNameUseCase(repository: getIt<SettingsRepository>()),
  );
  getIt.registerLazySingleton<UploadShopLogoUseCase>(
    () => UploadShopLogoUseCase(repository: getIt<SettingsRepository>()),
  );
  getIt.registerLazySingleton<UploadShopLogoUrlUseCase>(
    () => UploadShopLogoUrlUseCase(repository: getIt<SettingsRepository>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(repository: getIt<SettingsRepository>()),
  );

  getIt.registerFactory<SettingsCubit>(
    () => SettingsCubit(
      getIt<GetUserDataUseCase>(),
      getIt<UpdateShopNameUseCase>(),
      getIt<UpdateDisplayNameUseCase>(),
      getIt<UploadShopLogoUseCase>(),
      getIt<UploadShopLogoUrlUseCase>(),
      getIt<LogoutUseCase>(),
    ),
  );
}
