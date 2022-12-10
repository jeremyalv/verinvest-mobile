import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './features/home/home.dart';
import './features/Auth/login.dart';
import './features/Auth/register.dart';
import '../../core/services/auth_request.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: "Verinvest",
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          debugShowCheckedModeBanner: false,
          //home: LoginPage(),
          initialRoute: "/login",
          routes: {
            "/": (ctx) => const Home(),
            LoginPage.routeName: (ctx) => const LoginPage(),
            RegisterPage.routeName: (ctx) => const RegisterPage(),
          },
        ));
  }
}
