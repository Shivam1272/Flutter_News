// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_news/views/home_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  // ignore: override_on_non_overriding_member
  String name = " ";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
      setState(() {
        changebutton = false;
      });
    }
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Image.asset(
                    "assets/images/hey.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Welcome $name",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter UserName",
                              labelText: "UserName "),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password "),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 8) {
                              return " Password length should be atleast 8";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () => movetohome(context),
                          child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changebutton ? 50 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: changebutton
                                  ? Icon(Icons.done, color: Colors.white)
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(
                                    changebutton ? 50 : 8),
                              )),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}
