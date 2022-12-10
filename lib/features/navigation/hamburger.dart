import 'package:flutter/material.dart';
import 'package:verinvest_mobile/features/Auth/login.dart';
import 'package:verinvest_mobile/features/Auth/register.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import '../collections/collections.dart';
import '../forum_post/forum_post.dart';
import '../education_post/education_post.dart';

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
            title: const Text("Profile"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(
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
                      builder: (context) => Collections(
                          // Replace with widget
                          )));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            // About
            title: const Text("Forum Post"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForumPost(
                          // Replace with widget
                          )));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            // About
            title: const Text("Edukasi Post"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EducationPost(
                          // Replace with widget
                          )));
            },
          ),
          const SizedBox(height: 5),
          ListTile(
            // About
            title: const Text("Register"),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterPage(
                          // Replace with widget
                          )));
            },
          ),
        ],
      ),
    )));
  }
}
