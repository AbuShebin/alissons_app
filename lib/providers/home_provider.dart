import 'package:alissons_app/models/home_response_model.dart';
import 'package:alissons_app/models/user_model.dart';
import 'package:alissons_app/providers/user_provider.dart';
import 'package:alissons_app/services/home_service/home_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeDataProvider = FutureProvider.family<HomeResponse, UserModel>((
  ref,
  args,
) async {
  final user = ref.read(userProvider);
  final repo = ref.watch(homeServiceProvider);
  final token = args.token;
  return repo.fetchHomeData(id: args.id, token: token);
});
