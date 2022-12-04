import 'package:flutter/material.dart';
import '../home/navbar.dart';

class Collections extends StatelessWidget {
  const Collections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Navbar(),
            Center(child: Text("Collections")),
          ],
        ),
      ),
    );
  }
}
