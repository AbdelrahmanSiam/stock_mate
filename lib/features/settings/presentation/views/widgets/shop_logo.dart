import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';
import 'package:stock_mate/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';

class ShopLogo extends StatefulWidget {
  const ShopLogo({
    super.key,
    required this.user,
    required this.isUploadingLogo,
  });
  final SettingsUserEntity user;
  final bool isUploadingLogo;

  @override
  State<ShopLogo> createState() => _ShopLogoState();
}

class _ShopLogoState extends State<ShopLogo> {
  Future<void> _pickLogo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (file != null && mounted) {
      context.read<SettingsCubit>().uploadShopLogo(File(file.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isUploadingLogo ? null : _pickLogo,
      child: Stack(
        children: [
          // Avatar
          CircleAvatar(
            radius: 48,
            backgroundColor: AppColorsDarkMode.border,
            backgroundImage: widget.user.shopLogoUrl.isNotEmpty
                ? CachedNetworkImageProvider(widget.user.shopLogoUrl)
                : null,
            child: widget.user.shopLogoUrl.isEmpty
                ? const Icon(
                    Icons.store_outlined,
                    size: 40,
                    color: AppColorsDarkMode.textSecondary,
                  )
                : null,
          ),

          // Loading overlay لما بيترفع اللوجو
          if (widget.isUploadingLogo)
            Positioned.fill(
              child: CircleAvatar(
                backgroundColor: AppColorsDarkMode.background.withValues(
                  alpha: 0.7,
                ),
                child: const CircularProgressIndicator(
                  color: AppColorsDarkMode.primary,
                  strokeWidth: 2,
                ),
              ),
            ),

          // Edit badge
          if (!widget.isUploadingLogo)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: AppColorsDarkMode.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 14, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
