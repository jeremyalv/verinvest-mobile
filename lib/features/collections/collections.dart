import 'package:flutter/material.dart';
import '../navigation/hamburger.dart';
import '../navigation/bottom_navbar.dart';
import '../profile/profile.dart';
import '../navigation/verinvest_appbar.dart';

class Collections extends StatelessWidget {
  const Collections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VerinvestAppbar(),
      drawer: Hamburger(),
      body: SafeArea(
        child: Column(
          children: [
            Navbar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
