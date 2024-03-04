import 'package:blog_post_app/screens/layouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/post_provider.dart';
import '../utils/global_extentions.dart';

class BookmarkedScreen extends ConsumerWidget {
  const BookmarkedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookMarked = ref.watch(postBookMarkedProvider);
    final List<Widget> showBookMark = bookMarked.isEmpty 
      ? [
        const Center(
          heightFactor: 5,
          child: Column(
            children: [
              Icon(Icons.turned_in_not, size: 60, color: Colors.grey,),
              Text('No Bookmarked available', style: TextStyle(color: Colors.grey))
            ]
          )
        )
      ] 
      : bookMarked.map<Widget>((item) => 
      ListTile(
        onTap: () {
          // print(id);
          context.go('/home/post/${item.id}');
        },
        contentPadding: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
          leading: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(10)), child: Image(width: 60, height: 60, fit: BoxFit.cover,image: NetworkImage('https://picsum.photos/500/300?random=${item.id}')),),
          title: Text(
            item.title.capitalize(),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
      )
    ).toList();

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
                  child: Text("My BookMarked", textAlign: TextAlign.end, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                )
              )
            ),
            ...showBookMark// SizedBox(height: 300, child: )
          ],
        )
      ),
    ),
    );
  }
}