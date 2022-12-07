import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final String text;
  final Icon optionIcon;

  const MenuOption({super.key, required this.text, required this.optionIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            optionIcon,
            const SizedBox(
              height: 4,
            ),
            Text(
              "$text",
              style: TextStyle(color: Colors.grey[500], fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
