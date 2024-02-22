
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final widget;
  final Widget body;
  final Widget ?floating;

  const MainLayout({super.key, required this.widget, required this.body, this.floating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, 
        items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarked'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ],),
      floatingActionButton: floating,
    );
  }
}