import 'package:alissons_app/core/constands/api_constands.dart';
import 'package:alissons_app/models/login_query_params_model.dart';
import 'package:alissons_app/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginServiceProvider = Provider<LoginService>((ref) => LoginService());

class LoginService {
  final Dio dio = Dio();
  Future<UserModel> login({
    required String emailphone,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "${ApiConstands.baseURL}${ApiConstands.login}",
        data: {'email_phone': emailphone, 'password': password},
      );

      print(response.data);
      print(response.statusCode);

      if (response.statusCode == 200) {
        if (response.data["success"] == 1) {
          final data = response.data;
          return UserModel.fromMap(data["customerdata"]);
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
