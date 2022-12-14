import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
//import 'package:pbp_django_auth/pbp_django_auth.dart';
import '../../core/services/auth_request.dart';
import 'package:flutter/gestures.dart';
import '../../core/theme/base_colors.dart';

void _showErrors(context, Map errors) {
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(child: Text(errors["message"].toString())),
            ),
          ],
        );
      });
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    // The rest of your widgets are down below
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: BaseColors.green.shade300),
          child: Column(children: <Widget>[
            SizedBox(height: 80),
            SizedBox(height: 20),
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
                          SizedBox(height: 60),
                          const Image(
                            image: AssetImage(
                                'assets/images/verinvest_logo-2.png'),
                            alignment: Alignment.center,
                          ),
                          SizedBox(height: 60),
                          Form(
                            key: _loginFormKey,
                            child: Column(
                              children: [
                                Container(
                                  //padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    onChanged: (String value) {
                                      username = value;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: '  Username',
                                        hintStyle: TextStyle(
                                          color: Colors.black54,
                                        ),
                                        border: InputBorder.none),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Username harus diisi";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Password
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      onChanged: (String value) {
                                        password = value;
                                      },
                                      obscureText: !isPasswordVisible,
                                      decoration: InputDecoration(
                                        hintText: '  Password',
                                        hintStyle: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          color: Colors.black,
                                          splashRadius: 1,
                                          icon: Icon(isPasswordVisible
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined),
                                          onPressed: togglePasswordView,
                                        ),
                                      ),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Password harus diisi";
                                        }
                                        return null;
                                      },
                                    )),
                                SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              BaseColors.green.shade500),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF98D0AC)),
                                      overlayColor: MaterialStateProperty
                                          .resolveWith<Color?>(
                                              (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.green.shade300;
                                        }
                                        return null;
                                      }),
                                    ),
                                    onPressed: () async {
                                      if (_loginFormKey.currentState!
                                          .validate()) {
                                        final response = await request.login(
                                            "https://verinvest.up.railway.app/flutter-auth/login/",
                                            {
                                              'username': username,
                                              'password': password,
                                            });

                                        if (request.loggedIn) {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  '/',
                                                  (Route<dynamic> route) =>
                                                      false);
                                        } else {
                                          _showErrors(context, response);
                                        }
                                      }
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Row(
                                    children: [
                                      RichText(
                                          text:
                                              TextSpan(text: "              ")),
                                      RichText(
                                        text: TextSpan(
                                          text: "Belum memiliki akun?",
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: " Daftar disini",
                                              style: const TextStyle(
                                                color: Colors.blue,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.popAndPushNamed(
                                                      context, "/register");
                                                })),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ])))),
          ]),
        )));
  }
}
