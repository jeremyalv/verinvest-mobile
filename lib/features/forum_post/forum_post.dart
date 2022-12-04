import 'package:flutter/material.dart';
import '../home/navbar.dart';

class ForumPost extends StatelessWidget {
  const ForumPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
