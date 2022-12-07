import 'package:flutter/material.dart';
import '../profile/profile.dart';

class VerinvestAppbar extends StatelessWidget with PreferredSizeWidget {
  // Preffered size required for PreferredSizeWidget extension
  final Size prefSize;

  const VerinvestAppbar({
    super.key,
    this.prefSize = const Size.fromHeight(56.0),
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.green,
        ),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset('assets/images/verinvest_logo-1.png', width: 140),
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
        ]));
  }
}
