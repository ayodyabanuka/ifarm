import 'package:flutter/material.dart';
import 'package:ifarm/screens/data.dart';
import 'package:fluttertoast/fluttertoast.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        leadingWidth: 0,
        leading: Container(),
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Ifarm',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Login',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'poppins', fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(57, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value) {
                    print(value);
                  },
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(57, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: FlatButton(
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                    if (emailController.text == '' &&
                        passwordController.text == '') {
                      Fluttertoast.showToast(
                          msg: 'Enter Credintials',
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT);
                    } else {
                      if (emailController.text == 'ab@gmail.com' &&
                          passwordController.text == 'ab123') {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => datafromfirebase()),
                            (route) => false);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Wrong Credintials',
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT);
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Color(0xffFEC427),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      child: Text('Login'),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
