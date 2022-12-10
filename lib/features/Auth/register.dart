import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import '../../core/services/auth_request.dart';

void _showErrors(context, errors) {
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var errorList in errors.values)
                    for (var error in errorList)
                      Column(children: [
                        Text(error.toString()),
                        const SizedBox(
                          height: 5,
                        )
                      ]),
                ],
              ),
            ),
          ],
        );
      });
}

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String email = "";
  String username = "";
  String password1 = "";
  String password2 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(210, 224, 239, 1),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 30,
                ),

                // Form
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      // Email
                      Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 250, 0.95),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            onChanged: (String value) {
                              email = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(200, 200, 200, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email tidak boleh kosong";
                              } else if (!EmailValidator.validate(value)) {
                                return "Email tidak valid";
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      // Username
                      Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 250, 0.95),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            onChanged: (String value) {
                              username = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(200, 200, 200, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Username tidak boleh kosong";
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      // Password
                      Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 250, 0.95),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            onChanged: (String value) {
                              password1 = value;
                            },
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Color.fromRGBO(200, 200, 200, 1),
                              ),
                              suffixIcon: IconButton(
                                color: const Color.fromRGBO(200, 200, 200, 1),
                                splashRadius: 1,
                                icon: Icon(isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: togglePasswordView,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password tidak boleh kosong";
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      // Confirm Password
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 0.95),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          onChanged: (String value) {
                            password2 = value;
                          },
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(200, 200, 200, 1),
                            ),
                            suffixIcon: IconButton(
                              color: const Color.fromRGBO(200, 200, 200, 1),
                              splashRadius: 1,
                              icon: Icon(isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: togglePasswordView,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong";
                            } else if (value != password1) {
                              return "Password tidak sama";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Register Button
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(255, 0, 0, 1)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color.fromRGBO(204, 23, 40, 1);
                              }
                              return null;
                            }),
                          ),
                          onPressed: () async {
                            if (_registerFormKey.currentState!.validate()) {
                              final response = await request.post(
                                  "https://verinvest.up.railway.app/auth/signup",
                                  jsonEncode(<String, String>{
                                    'email': email,
                                    'username': username,
                                    'password1': password1,
                                    'password2': password2,
                                  }));

                              if (response["status"] == true) {
                                await request.login(
                                    "https://verinvest.up.railway.app/auth/login",
                                    {
                                      'username': username,
                                      'password': password1,
                                    });
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/', (Route<dynamic> route) => false);
                              } else {
                                _showErrors(context, response);
                              }
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: "Sudah memiliki akun?",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.popAndPushNamed(context, "/login");
                        }),
                ),
              ],
            ),
          ),
        ));
  }
}
