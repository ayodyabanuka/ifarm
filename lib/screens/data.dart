import 'dart:async';
import 'dart:ffi';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class datafromfirebase extends StatefulWidget {
  datafromfirebase({Key? key}) : super(key: key);

  @override
  State<datafromfirebase> createState() => _datafromfirebaseState();
}

String h = '70';
String t = '32';
String m = '250';
int s = 0;
bool svalue = false;

class _datafromfirebaseState extends State<datafromfirebase> {
  DatabaseReference humidityref =
      FirebaseDatabase.instance.ref().child('DHT11/Humidity');

  final temperatureref =
      FirebaseDatabase.instance.ref().child('DHT11/Temperature');

  final moistref = FirebaseDatabase.instance.ref().child('Moist/foodMoist');

  final servoref = FirebaseDatabase.instance.ref().child('SERVO');

  @override
  void initState() {
    super.initState();

    getData();
    runTimer();
    servovalueinbool();
  }

  Timer? timer;
  void runTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      getData();
      servovalueinbool();
    });
  }

  servovalueinbool() {
    if (s == 0) {
      setState(() {
        svalue = false;
      });
    } else {
      setState(() {
        svalue = true;
      });
    }
  }

  getData() {
    humidityref.onValue.listen((event) {
      setState(() {
        h = event.snapshot.value.toString();
      });
    });
    temperatureref.onValue.listen((event) {
      setState(() {
        t = event.snapshot.value.toString();
      });
    });
    moistref.onValue.listen((event) {
      setState(() {
        m = event.snapshot.value.toString();
      });
    });
    servoref.onValue.listen((event) {
      setState(() {
        s = int.parse(event.snapshot.value.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Feeding System',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Sensor Data',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 20,
                fontFamily: 'poppins',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          color:
                              double.parse(h) >= 70.0 && double.parse(h) <= 90.0
                                  ? Colors.green
                                  : Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Humidity ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      h,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                    const Text(
                                      "%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          color:
                              double.parse(t) > 10.0 && double.parse(t) < 21.0
                                  ? Colors.green
                                  : Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Temp',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      t,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                    const Text(
                                      "°C",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          color: svalue ? Colors.green : Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Food',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedToggleSwitch<bool>.dual(
                                      current: svalue,
                                      first: false,
                                      second: true,
                                      dif: 20.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 5.0,
                                      height: 61,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 1.5),
                                        ),
                                      ],
                                      onChanged: (val) {
                                        setState(() {
                                          updateone(val);
                                        });
                                      },
                                      colorBuilder: (val) =>
                                          val ? Colors.green : Colors.red,
                                      iconBuilder: (value) => value
                                          ? Icon(Icons.fastfood)
                                          : Icon(Icons.no_food),
                                      textBuilder: (value) => value
                                          ? Center(child: Text('Release'))
                                          : Center(child: Text('Hold')),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          color:
                              double.parse(m) > 200.0 && double.parse(m) < 300.0
                                  ? Colors.green
                                  : Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Moisture',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      m,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateone(bool val) async {
    final servoref1 = FirebaseDatabase.instance.ref();
    if (val == true) {
      await servoref1.update({
        "SERVO": 1,
      });
    } else {
      await servoref1.update({
        "SERVO": 0,
      });
    }
  }
}
