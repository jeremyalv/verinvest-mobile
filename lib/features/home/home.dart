import 'package:flutter/material.dart';
import '../navigation/bottom_navbar.dart';
import '../navigation/hamburger.dart';
import '../navigation/verinvest_appbar.dart';
import '../profile/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VerinvestAppbar(),
      drawer: Hamburger(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [Text("home")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
