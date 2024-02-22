import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final pageControl = PageController(
    initialPage: 1
  );

  void _handleButtonPress() {
    print('Login button pressed!');
    // GoRouter/
    // setState(() {
    //   // Update your state here
    // });
    context.goNamed('home');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        child: ListView(
        controller: pageControl,
        scrollDirection: Axis.vertical,
        children: [
          ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(3.1415926535897932 / 4),
                  colors: [
                    Color.fromARGB(255, 79, 48, 193),
                    Color.fromARGB(255, 82, 20, 227),
                    Color.fromARGB(255, 66, 140, 225)
                  ],
                ),
              ),
              height: 300,
              child: const Center(
                child: Image(
                  image: AssetImage('lib/images/logo.png'),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
          Container(
            // width: 0,
            constraints: const BoxConstraints(maxWidth: 200),
            child: Column(
              children: [
                const Text(
                  'Flutter App!',
                  style: TextStyle(fontSize: 40, color: Color.fromARGB(255, 83, 94, 249)),
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username Or Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: _handleButtonPress,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue[400]
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
          ),
          )
        ],
      )
    ),
      );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
