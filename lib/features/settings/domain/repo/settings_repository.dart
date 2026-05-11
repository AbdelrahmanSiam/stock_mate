import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, SettingsUserEntity>> getUserData();
  Future<Either<Failure, void>> updateShopName(String shopName);
  Future<Either<Failure, void>> updateDisplayName(String displayName);
  Future<Either<Failure, String>> uploadShopLogo(File image);
  Future<Either<Failure, void>> updateShopLogoUrl(String url);
  Future<Either<Failure, void>> logout();
}