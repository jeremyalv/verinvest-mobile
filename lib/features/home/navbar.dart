import 'package:flutter/material.dart';
import '../navigation/hamburger.dart';
import '../profile/profile.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/verinvest_logo-1.png',
          width: 140,
        ),
        Row(
          children: [
            SizedBox(
              width: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Image.asset(
                  'assets/images/user.png',
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: TextButton(
                child: const Icon(
                  Icons.menu,
                  size: 24,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Hamburger()));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
