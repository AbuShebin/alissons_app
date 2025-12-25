import 'package:alissons_app/models/banner_model.dart';
import 'package:alissons_app/models/product_response_model.dart';

class HomeResponse {
  final List<BannerModel> banners;
  final List<ProductResponseModel> recentViews;
  final List<ProductResponseModel> ourProducts;
  final List<ProductResponseModel> suggestedProducts;
  
  HomeResponse({
    required this.banners,
    required this.recentViews,
    required this.ourProducts,
    required this.suggestedProducts,
  });
  
  factory HomeResponse.fromMap(Map<String, dynamic> map) {
    return HomeResponse(
      banners: (map['banner1'] != null ? [BannerModel.fromMap(map['banner1'])] : [])
        ..addAll(map['banner2'] != null ? [BannerModel.fromMap(map['banner2'])] : [])
        ..addAll(map['banner3'] != null ? [BannerModel.fromMap(map['banner3'])] : []),
      recentViews: (map['recentviews'] as List? ?? [])
          .map((e) => ProductResponseModel.fromMap(e))
          .toList(),
      ourProducts: (map['ourproducts'] as List? ?? [])
          .map((e) => ProductResponseModel.fromMap(e))
          .toList(),
      suggestedProducts: (map['suggestedproducts'] as List? ?? [])
          .map((e) => ProductResponseModel.fromMap(e))
          .toList(),
    );
  }
}