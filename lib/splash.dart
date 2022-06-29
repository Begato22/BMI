import 'package:bmi_app/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // void initState() {
  //   super.initState();
  //   _navigatetohome();
  // }

  // _navigatetohome() async {
  //   await Future.delayed(const Duration(milliseconds: 3000), () {});
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(11, 22, 41, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/icon/icon.png'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Body Mass Index",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
        ),
        nextScreen: const MyHomePage(),
        duration: 3000,
      ),
    );
  }
}
