import 'package:blog_post_app/apis/post_api.dart';
import 'package:blog_post_app/models/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenIndexProvider = StateProvider<int>((ref) {
  return 0;
});
