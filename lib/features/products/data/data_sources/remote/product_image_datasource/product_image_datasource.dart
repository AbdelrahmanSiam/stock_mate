import 'dart:io';

abstract class ProductImageDataSource {
  Future<String> uploadImage(File image);
  Future<void> deleteImage(String imageUrl);
}