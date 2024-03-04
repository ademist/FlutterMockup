
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/color_scheme.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController();

  bool? isChecked = false;

  final pageControl = PageController(
    initialPage: 1
  );

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return const Color(0XFFF6F6F6);
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor[50],
          highlightColor: primaryColor[50],
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor[50]
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              color: Color.fromRGBO(187, 187, 187, 1),
            ),

          )
        ),
        home: Scaffold(
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SafeArea(
              left: false,
              right: false,
              child: ListView(
              controller: pageControl,
              scrollDirection: Axis.vertical,
              children: [
                const SizedBox(height: 123),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 56),
                    child: SvgPicture.asset('lib/assets/images/icons/logo.svg'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: '이메일 주소',
                          fillColor: Color.fromRGBO(246, 246, 246, 1),
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _controller,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: '비밀번호',
                          fillColor: Color.fromRGBO(246, 246, 246, 1),
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            //Event
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF56A4FF),
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            '로그인',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Row (children: [
                                Checkbox(
                                  // semanticLabel: '자동로그인',
                                  side: const BorderSide(width: 1, color: Colors.black12),
                                  checkColor: primaryColor[50],
                                  fillColor: MaterialStateProperty.resolveWith(getColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  '자동로그인',
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12
                                )
                            )
                            ],),
                          ),
                         const Text(
                            '비밀번호 찾기',
                            style: TextStyle(
                              color: Color.fromRGBO(153, 153, 153, 1),
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                      // Kakao
                      Container(
                        padding: const EdgeInsets.only(top: 41),
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            //Event
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFFEE500),
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Iconify(Ri.kakao_talk_fill, size: 24),
                              SizedBox(width: 4),
                              Text(
                                '카카오로 로그인',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]
                          ),
                        )
                      ),
                      // Apple
                      Container(
                        padding: const EdgeInsets.only(top: 11, bottom: 54),
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            //Event
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Iconify(Ri.apple_fill, size: 24, color: Color.fromRGBO(255, 255, 255, 1),),
                              SizedBox(width: 4),
                              Text(
                                '카카오로 로그인',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]
                          ),
                        )
                      )
                    ]
                  )
                )
              ],
            )
          )
        ),
      )
    );
  }
}