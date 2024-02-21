import 'package:flutter/material.dart';

import 'signin_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

@override
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 42, 27),
        body: Center(
            child: Column(children: [
          SizedBox(
            width: double.infinity,
            height: 640,
            child: Image.asset(
              "images/logo2.png",
              height: 300,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 66, 60, 60),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Welcome to Golden Age  \n\nYour Companion on the Journey of Graceful Aging. Embrace the wisdom of years and unlock a world of resources, support, and inspiration.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color.fromARGB(255, 244, 180, 63),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text(
                    "Let's age gracefully together",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ])));
  }
}
