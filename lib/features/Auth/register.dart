import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import '../../core/services/auth_request.dart';
import '../../core/theme/base_colors.dart';

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

  String? _usertype = "false";
  String firstname = "";
  String lastname = "";
  String email = "";
  String username = "";
  String password1 = "";
  String password2 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: BaseColors.green.shade300),
        child: Column(children: <Widget>[
          SizedBox(height: 10),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(children: <Widget>[
                      Form(
                        key: _registerFormKey,
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  onChanged: (String value) {
                                    firstname = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'First Name',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "First name tidak boleh kosong";
                                    }
                                    return null;
                                  },
                                )),
                            SizedBox(height: 10),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  onChanged: (String value) {
                                    lastname = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Last Name',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Last name tidak boleh kosong";
                                    }
                                    return null;
                                  },
                                )),
                            SizedBox(height: 10),
                            // Email
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  onChanged: (String value) {
                                    email = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email tidak boleh kosong";
                                    } else if (!EmailValidator.validate(
                                        value)) {
                                      return "Email tidak valid";
                                    }
                                    return null;
                                  },
                                )),
                            SizedBox(height: 10),
                            Container(
                              child: Column(
                                children: [
                                  Row(children: [
                                    Text("   I am a ...",
                                        textAlign: TextAlign.start),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Radio(
                                        value: "false",
                                        groupValue: _usertype,
                                        onChanged: (value) {
                                          setState(() {
                                            _usertype = value;
                                          });
                                        }),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("Regular User"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Radio(
                                        value: "true",
                                        groupValue: _usertype,
                                        onChanged: (value) {
                                          setState(() {
                                            _usertype = value;
                                          });
                                        }),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("Domain Expert"),
                                  ]),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Username
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  onChanged: (String value) {
                                    username = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
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
                              height: 10,
                            ),
                            // Password
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  onChanged: (String value) {
                                    password1 = value;
                                  },
                                  obscureText: !isPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                    suffixIcon: IconButton(
                                      color: const Color.fromRGBO(
                                          200, 200, 200, 1),
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
                              height: 10,
                            ),
                            // Confirm Password
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onChanged: (String value) {
                                  password2 = value;
                                },
                                obscureText: !isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                  suffixIcon: IconButton(
                                    color:
                                        const Color.fromRGBO(200, 200, 200, 1),
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
                              height: 10,
                            ),
                            // Register Button
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: double.infinity,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          BaseColors.green.shade500),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return const Color.fromRGBO(
                                          204, 23, 40, 1);
                                    }
                                    return null;
                                  }),
                                ),
                                onPressed: () async {
                                  if (_registerFormKey.currentState!
                                      .validate()) {
                                    final response = await request.post(
                                        "https://verinvest.up.railway.app/flutter-auth/register",
                                        jsonEncode(<String, String>{
                                          'first_name': firstname,
                                          'last_name': lastname,
                                          'email': email,
                                          'is_expert': _usertype.toString(),
                                          'username': username,
                                          'password1': password1,
                                          'password2': password2,
                                        }));

                                    if (response["status"] == true) {
                                      await request.login(
                                          "https://verinvest.up.railway.app/flutter-auth/login",
                                          {
                                            'username': username,
                                            'password': password1,
                                          });
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/',
                                              (Route<dynamic> route) => false);
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
                    ]))),
          )
        ]),
      ),
    );
  }
}
