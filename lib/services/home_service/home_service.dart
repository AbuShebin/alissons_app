import 'package:alissons_app/core/constands/api_constands.dart';
import 'package:alissons_app/models/home_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeServiceProvider = Provider<HomeService>((ref) => HomeService());

class HomeService {
  final Dio dio = Dio();

  Future<HomeResponse> fetchHomeData({
    required String id,
    required String token,
  }) async {
    try {
      final response = await dio.post(
        ApiConstands.home,
        queryParameters: {'id': id, 'token': token},
      );

      print("response data${response.data}");
      print("response status code ${response.statusCode}");

      if (response.statusCode == 200) {
        if (response.data["success"] == 1) {
          final data = response.data;
          return HomeResponse.fromMap(data);
        } else {
          throw response.data["message"];
        }
      } else {
        throw "something went wrong";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
