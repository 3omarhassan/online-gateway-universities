// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailcon = TextEditingController();
  final _passwordcon = TextEditingController();
  final _namecon = TextEditingController();
  final _phonecon = TextEditingController();

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcon.text.trim(), password: _passwordcon.text.trim());
    Navigator.of(context).pushNamed("/auth");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcon.dispose();
    _passwordcon.dispose();
    _namecon.dispose();
    _phonecon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Scaffold(
              body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: "myfont",
                                  color: Colors.grey[800]),
                            ),
                            SizedBox(
                              height: 21,
                            ),
                            SvgPicture.asset(
                              "assets/icons/signup.svg",
                              height: 222,
                            ),
                            SizedBox(
                              height: 27,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(66),
                              ),
                              width: 266,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: TextField(
                                controller: _namecon,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.purple[800],
                                    ),
                                    hintText: "User Name :",
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 23,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(66),
                              ),
                              width: 266,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: TextField(
                                controller: _emailcon,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.purple[800],
                                    ),
                                    hintText: "Your Email :",
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 23,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(66),
                              ),
                              width: 266,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: TextField(
                                controller: _phonecon,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.phone,
                                      color: Colors.purple[800],
                                    ),
                                    hintText: "Your Phone Number :",
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 23,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(66),
                              ),
                              width: 266,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: TextField(
                                controller: _passwordcon,
                                obscureText: true,
                                decoration: InputDecoration(
                                    suffix: Icon(
                                      Icons.visibility,
                                      color: Colors.purple[900],
                                    ),
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.purple[800],
                                      size: 19,
                                    ),
                                    hintText: "Password :",
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                signUp();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.purple),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 89, vertical: 10)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(27))),
                              ),
                              child: Text(
                                "Sign up",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an accout? "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child: Text(
                                    " Log in",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            SizedBox(
                              width: 299,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                    thickness: 0.6,
                                    color: Colors.purple[900],
                                  )),
                                  Text(
                                    "OR",
                                    style: TextStyle(
                                      color: Colors.purple[900],
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                    thickness: 0.6,
                                    color: Colors.purple[900],
                                  )),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 27),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.purple, width: 1)),
                                      child: SvgPicture.asset(
                                        "assets/icons/facebook.svg",
                                        color: Colors.purple[400],
                                        height: 27,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 22,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.purple, width: 1)),
                                      child: SvgPicture.asset(
                                        "assets/icons/google-plus.svg",
                                        color: Colors.purple[400],
                                        height: 27,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 22,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.purple, width: 1)),
                                      child: SvgPicture.asset(
                                        "assets/icons/twitter.svg",
                                        color: Colors.purple[400],
                                        height: 27,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Image.asset(
                        "assets/images/main_top.png",
                        width: 111,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/images/login_bottom.png",
                        width: 111,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}