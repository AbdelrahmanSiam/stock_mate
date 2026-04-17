import 'dart:io';

import 'package:stock_mate/features/products/data/data_sources/remote/product_image_datasource/product_image_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ProductImageDataSourceImpl implements ProductImageDataSource {
  final SupabaseClient supabase;
  const ProductImageDataSourceImpl(this.supabase);

  @override
  Future<String> uploadImage(File image) async {
    final String path = 'products/${const Uuid().v4()}.jpg';

    await supabase.storage.from('products').upload(
          path,
          image,
          fileOptions: const FileOptions(
            contentType: 'image/jpeg',
            upsert: false,
          ),
        );

    return supabase.storage.from('products').getPublicUrl(path);
  }

  @override
  Future<void> deleteImage(String imageUrl) async {
    if (imageUrl.isEmpty) return;
    // Extract path form url
    // URL: https://xxxx.supabase.co/storage/v1/object/public/products/uuid.jpg
    // Path need : products/uuid.jpg
    final Uri uri = Uri.parse(imageUrl);
    final String path = uri.pathSegments
        .skipWhile((s) => s != 'products')
        .join('/');
    await supabase.storage.from('products').remove([path]);
  }
}