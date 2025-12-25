// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductResponseModel {
  final int productId;
  final String slug;
  final String name;
  final String image;
  final double price;
  final double oldPrice;
  final String category;
  final double stock;
  ProductResponseModel({
    required this.productId,
    required this.slug,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.category,
    required this.stock,
  });

  factory ProductResponseModel.fromMap(Map<String, dynamic> map) {
    return ProductResponseModel(
      productId: map['productId'],
      slug: map['slug'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      oldPrice: map['oldPrice'],
      category: map['category'],
      stock: map['stock'],
    );
  }
}
