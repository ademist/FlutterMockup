import 'package:blog_post_app/screens/layouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/post_provider.dart';
import 'package:go_router/go_router.dart';
import '../utils/global_extentions.dart';
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsFutureProvider);

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      home: MainLayout(
      title: '',
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              // height: 200,
              child: Align(
                alignment:Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text("Today's Blog", textAlign: TextAlign.end, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                )
              )
            ),
            Card(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage('https://picsum.photos/id/27/3264/1836'), fit: BoxFit.cover)
                ),
                height: 250,
              ),
            ),
            SizedBox(
              // height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Latest', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: Text('See All', style: TextStyle(color: Colors.grey.shade400),))
                ],
              )
            ),
            postsAsyncValue.when(
              data: (posts) {
                List<Widget> ?nodeList = [];
                posts.toList().forEach((post) { 
                  // ignore: no_leading_underscores_for_local_identifiers
                  String id = post.id.toString();

                  nodeList.add(
                    ListTile(
                      onTap: () {
                        print(id);
                        context.go('/home/post/$id');
                      },
                      contentPadding: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
                        leading: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)), child: Image(width: 60, height: 60, fit: BoxFit.cover,image: NetworkImage('https://picsum.photos/500/300?random=$id')),),
                        title: Text(
                          post.title.capitalize(),
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                    )
                  );
                 });
                return Column(
                    children: nodeList,
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text('Error: $err')
            )
            
            // SizedBox(height: 300, child: )
          ],
        )
      ),
    ),
    );
  }
}