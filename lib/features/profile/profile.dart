// TEMPLATE ONLY

import 'package:flutter/material.dart';
import '../home/navbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
