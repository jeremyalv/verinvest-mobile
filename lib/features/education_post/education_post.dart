import 'package:flutter/material.dart';
import '../home/navbar.dart';

class EducationPost extends StatelessWidget {
  const EducationPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Navbar(),
            Center(child: Text("Education")),
          ],
        ),
      ),
    );
  }
}
