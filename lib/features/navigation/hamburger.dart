import 'package:flutter/material.dart';
import '../home/home.dart';

class Hamburger extends StatelessWidget {
  const Hamburger({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
            child: Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          ListTile(
            // Home
            title: const Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                          // Replace with widget
                          )));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            // Collections
            title: const Text("Collections"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                          // Replace with widget
                          )));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            // About
            title: const Text("About"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                          // Replace with widget
                          )));
            },
          ),
        ],
      ),
    )));
  }
}
