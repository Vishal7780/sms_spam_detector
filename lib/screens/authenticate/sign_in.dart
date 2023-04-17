import 'package:dummy/screens/Home/Home.dart';
import 'package:dummy/screens/authenticate/Register.dart';
import 'package:dummy/screens/wrapper.dart';
import 'package:flutter/material.dart';

import 'package:dummy/services/auth.dart';
import 'package:dummy/styles.dart';
import 'package:dummy/shared/loading.dart';
import 'package:getwidget/getwidget.dart';

class SignIn extends StatefulWidget {
  final ToggleView;

  const SignIn({Key? key, required this.ToggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  var email = '';
  var password = '';
  var error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.grey[250],
            appBar: AppBar(
              backgroundColor: Colors.grey[700],
              elevation: 0.0,
              title: const Text(
                'Sign In',
              ),
              actions: <Widget>[
                TextButton.icon(
                  label: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.green),
                  ),
                  icon: const Icon(Icons.person, color: Colors.green),
                  onPressed: () {
                    widget.ToggleView();
                  },
                )
              ],
            ),
            body: Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/logo.png',

                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.fill),

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                              label: const Text("Email"),
                              labelStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.email,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              floatingLabelStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.yellow,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter the email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                            {}
                          },
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 100,
                                offset: const Offset(1, 1),
                                color: Colors.black.withOpacity(0.5))
                          ]),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              label: const Text("Password"),
                              labelStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.password_rounded,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              floatingLabelStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.amber,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          obscureText: true,
                          validator: (val) => val!.length < 6
                              ? 'Enter the Password with more than 6 characters'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                            {}
                          },
                        ),
                        const SizedBox(height: 30),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {

                               setState(() {
                                loading = true;
                              });
                               dynamic result = await _auth.SignInWithEmailandPassword(email, password);
                              if (result == null) {

                                setState(() {
                                  loading = false;
                                  error = 'Sorry No email exists';
                                });
                              }
                            }
                          },
                          color: Colors.green[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          error,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                )),
          );
  }
}
