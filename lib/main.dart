import 'dart:ui';

import 'package:flutter/material.dart';

class CurvedBackground extends StatelessWidget {

  const CurvedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    List gcolors = [];
    gcolors.add(const Color.fromARGB(0, 74, 79, 152));

    return Scaffold(
      body: ClipPath(
        clipper: BottomWaveClipper(),
        child: Container(
          color: const Color.fromARGB(255, 83, 94, 249),
          height: 300,
          child: const Center(
            child: Image(image: AssetImage('lib/images/logo.png'), width: 100, height: 100,),
          ),
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 50); // Start from the top left corner

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0); // to the top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

void main() => runApp(const MaterialApp(home: CurvedBackground()));
