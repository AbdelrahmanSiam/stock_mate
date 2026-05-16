import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/settings/data/data_sources/remote/settings_remote_datasource.dart';
import 'package:stock_mate/features/settings/data/models/settings_user_model.dart';
import 'package:stock_mate/features/settings/data/repo/helper.dart';
import 'package:stock_mate/features/settings/domain/repo/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;
  const SettingsRepositoryImpl(this.remoteDataSource);
  @override
  Stream<Either<Failure, SettingsUserModel>> getUserData() {
    return remoteDataSource
        .getUserData()
        .map<Either<Failure, SettingsUserModel>>(
          (userModel) => Right(userModel),
        );
  }

  @override
  Future<Either<Failure, void>> logout() {
    return handleSettingsRepository(() => remoteDataSource.logout());
  }

  @override
  Future<Either<Failure, void>> updateDisplayName(String displayName) {
    return handleSettingsRepository(
      () => remoteDataSource.updateDisplayName(displayName),
    );
  }

  @override
  Future<Either<Failure, void>> updateShopLogoUrl(String url) {
    return handleSettingsRepository(
      () => remoteDataSource.updateShopLogoUrl(url),
    );
  }

  @override
  Future<Either<Failure, void>> updateShopName(String shopName) {
    return handleSettingsRepository(
      () => remoteDataSource.updateShopName(shopName),
    );
  }

  @override
  Future<Either<Failure, String>> uploadShopLogo(File image) {
    return handleSettingsRepository(
      () => remoteDataSource.uploadShopLogo(image),
    );
  }
}
