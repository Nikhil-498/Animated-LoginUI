// ignore_for_file: use_full_hex_values_for_flutter_colors, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, import_of_legacy_library_into_null_safe, unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: const LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _headingColor = const Color(0xFFB40284A);

  double _loginYoffset = 0;
  double _loginOpacity = 1;
  double _loginXoffset = 0;

  double _loginwdith = 0;
  double _loginHeight = 0;

  double _registerYoffset = 0;
  double _registerHeight = 0;
  double _headingTop = 100;

  double windowsWidth = 0;
  double windowsHeight = 0;

  bool _keyboardVisible = false;

  late Image _image;
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        _keyboardVisible = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    windowsHeight = MediaQuery.of(context).size.height;
    windowsWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowsHeight - 270;
    _registerHeight = windowsHeight - 270;
    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Colors.grey;
        _loginYoffset = windowsHeight;
        _registerYoffset = windowsHeight;
        _loginHeight = _keyboardVisible ? windowsHeight : windowsHeight - 270;
        _loginXoffset = 0;
        _loginwdith = windowsWidth;
        _loginOpacity = 1;
        _headingTop = 100;
        break;
      case 1:
        _backgroundColor = Colors.indigo;
        _headingColor = Colors.white;
        _loginYoffset = _keyboardVisible ? 40 : 280;
        _loginHeight = _keyboardVisible ? windowsHeight : windowsHeight - 270;
        _loginXoffset = 0;
        _registerYoffset = windowsHeight;
        _loginwdith = windowsWidth;
        _loginOpacity = 1;
        _headingTop = 90;

        break;
      case 2:
        _backgroundColor = Colors.indigo;
        _headingColor = Colors.white;
        _loginYoffset = _keyboardVisible ? 30 : 250;
        _registerYoffset = _keyboardVisible ? 55 : 280;
        _loginXoffset = 20;
        _loginwdith = windowsWidth - 40;
        _loginHeight = _keyboardVisible ? windowsHeight : windowsHeight - 250;
        _loginOpacity = 0.7;
        _registerHeight =
            _keyboardVisible ? windowsHeight : windowsHeight - 280;
        _headingTop = 80;
        break;

      case 4:
        _image = Image.asset('assets/login.jpg');
    }
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(
            milliseconds: 1000,
          ),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(
                            milliseconds: 1000,
                          ),
                          margin: EdgeInsets.only(top: _headingTop),
                          child: Text(
                            'Learn Free',
                            style: TextStyle(
                              color: _headingColor,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'We make learning easy.............',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: _headingColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 4;
                        });
                      },
                      child: Image.asset('assets/splash.jpg')),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(32.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_pageState != 0) {
                        _pageState = 0;
                      } else {
                        _pageState = 1;
                      }
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFF40284A),
                        borderRadius: BorderRadius.circular(50.0)),
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 2;
            });
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.all(32.0),
            width: _loginwdith,
            height: _loginHeight,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(
              milliseconds: 1000,
            ),
            transform:
                Matrix4.translationValues(_loginXoffset, _loginYoffset, 1),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 26.0),
                      child: const Text(
                        'Login to continue',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    const InputWithIcon(
                      icon: Icons.email,
                      hint: 'Enter a email..',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: 'Enter password',
                    ),
                  ],
                ),
                Column(
                  children: [
                    const PrimaryButton(btnTxt: 'Login'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageState = 2;
                          });
                        },
                        child: const OutlineBtn(btntxt: 'Create new account')),
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 1;
            });
          },
          child: AnimatedContainer(
            height: _registerHeight,
            padding: const EdgeInsets.all(32.0),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(
              milliseconds: 1000,
            ),
            transform: Matrix4.translationValues(0, _registerYoffset, 1),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.0),
                topLeft: Radius.circular(25.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 26.0),
                      child: const Text(
                        'Create New Account',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    const InputWithIcon(
                      icon: Icons.email,
                      hint: 'Enter a email',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: 'Enter password',
                    ),
                  ],
                ),
                Column(
                  children: [
                    const PrimaryButton(btnTxt: 'Create Account'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                        onTap: (() {
                          setState(() {
                            _pageState = 1;
                          });
                        }),
                        child: const OutlineBtn(btntxt: 'Back to login')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnTxt;
  const PrimaryButton({required this.btnTxt, Key? key}) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFB40284A),
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          widget.btnTxt,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class OutlineBtn extends StatefulWidget {
  final String btntxt;
  const OutlineBtn({required this.btntxt, Key? key}) : super(key: key);

  @override
  State<OutlineBtn> createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFB40284A),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          widget.btntxt,
          style: const TextStyle(
            color: Color(0xFFB40284A),
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  const InputWithIcon({required this.icon, required this.hint, Key? key})
      : super(key: key);

  @override
  State<InputWithIcon> createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFBC7C7C7),
          ),
          borderRadius: BorderRadius.circular(50.0)),
      child: Row(
        children: [
          Container(
            width: 60.0,
            child: Icon(
              widget.icon,
              size: 20.0,
              color: const Color(0xFF89B9B9),
            ),
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                border: InputBorder.none,
                hintText: widget.hint),
          )),
        ],
      ),
    );
  }
}
