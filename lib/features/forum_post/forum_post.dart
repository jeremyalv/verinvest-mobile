import 'package:flutter/material.dart';
import '../navigation/bottom_navbar.dart';
import '../navigation/hamburger.dart';
import '../profile/profile.dart';
import '../navigation/verinvest_appbar.dart';

class ForumPost extends StatelessWidget {
  const ForumPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VerinvestAppbar(),
      drawer: Hamburger(),
      body: SafeArea(
        child: Column(
          children: [
            Navbar(),
            Center(child: Text("Forum")),
          ],
        ),
      ),
    );
  }
}
