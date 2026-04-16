import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.barcode,
    required super.category,
    required super.buyPrice,
    required super.sellPrice,
    required super.quantity,
    required super.threshold,
    required super.imageUrl,
  });

  factory ProductModel.fromFirebase(Map<String, dynamic> json, String id) {
    return ProductModel(
      id: id,
      name: json[kProductName] ?? "",
      barcode: json[kBarcode] ?? "",
      category: json[kCategory] ?? "",
      buyPrice: (json[kBuyPrice] as num).toDouble(),
      sellPrice: (json[kSellPrice] as num).toDouble(),
      quantity: (json[kQuantity] as num).toInt(),
      threshold: (json[kThreshold] as num).toInt(),
      imageUrl: json[kImageUrl] ?? "",
    );
  }

  Map<String, dynamic> toFirebase() {
    return {
      kProductName: name,
      kBarcode: barcode,
      kCategory: category,
      kBuyPrice: buyPrice,
      kSellPrice: sellPrice,
      kQuantity: quantity,
      kThreshold: threshold,
      kImageUrl: imageUrl,
      kCreatedAt : FieldValue.serverTimestamp(),
    };
  }
}
