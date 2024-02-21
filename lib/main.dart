import 'package:flutter/material.dart';
class CurvedBackground extends StatelessWidget {

  const CurvedBackground({super.key});

  void login () {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              // color: const Color.fromARGB(255, 83, 94, 249),
              decoration: const BoxDecoration(gradient: LinearGradient(transform: GradientRotation(3.1415926535897932/4), colors: [Color.fromARGB(255, 79, 48, 193),Color.fromARGB(255, 82, 20, 227), Color.fromARGB(255, 66, 140, 225)])),
              height: 300,
              child: const Center(
                child: Center(child: Image(image: AssetImage('lib/images/logo.png'), width: 100, height: 100,),),
              ),
            ),
        ),
        const Expanded(
          child: Column(
            children: [
              Text('Flutter App!', style: TextStyle(fontSize: 40, color: Color.fromARGB(255, 83, 94, 249)),),
              Padding(padding: EdgeInsets.only(top: 30)),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 50, right: 50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username Or Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 50, right: 50),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          )
        )
      ],),
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
