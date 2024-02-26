
import 'package:blog_post_app/providers/global_provider.dart';
import 'package:blog_post_app/screens/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainLayout extends ConsumerWidget {

  final String ?title;
  final Widget body;
  final Widget ?floating;
  
  const MainLayout({super.key, required this.title, required this.body, this.floating});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: no_leading_underscores_for_local_identifiers
    final int _screenIndex = ref.watch(screenIndexProvider);

    return Scaffold(
      appBar: const TopNavBar(),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          ref.read(screenIndexProvider.notifier).state = index;
          int r = index + 1;
          print('screen$r');
          context.goNamed('screen$r');
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _screenIndex,
        items: const [
            BottomNavigationBarItem(
              icon:  Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmarked'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ],),
      floatingActionButton: floating,
    );
  }
}
