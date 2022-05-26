import 'package:flutter/material.dart';

import 'login.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      print(_controller.value);
      //  if the full duration of the animation is 8 secs then 0.5 is 4 secs
      if (_controller.value > 1) {
// When it gets there hold it there.
        _controller.value = 1;
      }
    });
    //set time to load the new page
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFEC427),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Color(0xffFEC427)),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset("assets/images/splash.gif"),
            const Text(
              'I Farm',
              style: TextStyle(
                fontSize: 65,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 37, 36, 36),
                fontFamily: 'DM Serif Text',
              ),
            )
          ],
        ),
      ),
    );
  }
}
