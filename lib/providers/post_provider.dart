import 'package:blog_post_app/apis/post_api.dart';
import 'package:blog_post_app/models/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postRepositoryProvider = StateProvider<PostApi>((ref) {
  return PostApi();
});

final postsFutureProvider = FutureProvider<List<Post>>((ref) async {
  return ref.watch(postRepositoryProvider).fetchPosts();
});

final postBookMarkedProvider = StateProvider<List<Post>>((ref) {
  final posts = ref.watch(postsFutureProvider);
  return posts.maybeWhen(
    data: (posts) => posts.where((post) => post.isMarked ?? false).toList(),
    orElse: () => [],
  );
});