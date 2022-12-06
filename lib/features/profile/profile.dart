// TEMPLATE ONLY

import 'package:flutter/material.dart';
import '../navigation/bottom_navbar.dart';
import '../navigation/hamburger.dart';
import '../navigation/verinvest_appbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VerinvestAppbar(),
      drawer: Hamburger(),
      body: SafeArea(
        child: Column(
          children: [
            Navbar(),
            Center(child: Text("Profile")),
          ],
        ),
      ),
    );
  }
}
