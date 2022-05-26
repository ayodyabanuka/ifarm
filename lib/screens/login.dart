import 'package:flutter/material.dart';
import 'package:ifarm/screens/data.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: Container(),
        backgroundColor: Color(0xffFEC427),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => datafromfirebase()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('Next'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
