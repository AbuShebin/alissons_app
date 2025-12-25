import 'package:alissons_app/models/login_query_params_model.dart';
import 'package:alissons_app/models/user_model.dart';
import 'package:alissons_app/services/login_service/repository/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = FutureProvider.family<UserModel, LoginQueryParamsModel>((
  ref,
  params,
) async {
  print("login controoler triggered");
  return ref
      .read(loginServiceProvider)
      .login(emailphone: params.email, password: params.password);
});
