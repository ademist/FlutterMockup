import 'package:blog_post_app/apis/user_api.dart';
import 'package:blog_post_app/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = StateProvider<UserApi>((ref) {
  return UserApi();
});

final userFutureProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(userRepositoryProvider).fetchUser();
});