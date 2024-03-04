// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ViewPostScreen extends StatelessWidget {
//   final String id;

//   const ViewPostScreen({super.key, required this.id});

//   Future<Map<String, dynamic>> fetchPost() async {
//     // Replace with your API endpoint
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));

//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return json.decode(response.body);
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load post');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post $id'),
//       ),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: fetchPost(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             // Assuming your API returns a JSON object with a 'title' field
//             return Center(child: Text('Post Title: ${snapshot.data!['title']}'));
//           } else {
//             return Center(child: Text('Unknown error'));
//           }
//         },
//       ),
//     );
//   }
// }


import 'package:blog_post_app/providers/post_provider.dart';
import 'package:blog_post_app/screens/layouts/post_page_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blog_post_app/models/post.dart';
import '../utils/global_extentions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class ViewPostScreen extends ConsumerWidget {
  final String id;

  const ViewPostScreen({super.key, required this.id});

    Future<Map<String, dynamic>> fetchPost() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: fetchPost(),
        builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return PostPageLayout(
      callBack: () {
        ref.read(postBookMarkedProvider.notifier).state.add(
          Post.fromJson({...snapshot.data!, 'isMarked': true})
        );
      },
      title: '',
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.network(
              'https://picsum.photos/3264/1836?random=$id',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(bottom: 40, top: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(
                  //   'Fitness',
                  //   style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  // ),
                  Text(
                    "${snapshot.data!['title']}".capitalize(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/${snapshot.data!["userId"]}.jpg'),
                      ),
                      const SizedBox(width: 8),
                      const Text('User Name O.'),
                      const Spacer(),
                      const Icon(Icons.favorite_border),
                      const Text('431'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${snapshot.data!['body']}".capitalize(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  )
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
            } else {
              return const Center(child: Text('Unknown error'));
            }
        })
    );
  }
}
