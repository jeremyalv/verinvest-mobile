import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool selected;

  const MenuOption(
      {super.key,
      required this.text,
      required this.iconData,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: selected ? Colors.green : Colors.grey[200],
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: selected
                    ? Colors.green.withOpacity(0.2)
                    : Colors.transparent,
                spreadRadius: 4,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData,
                size: 28, color: selected ? Colors.white : Colors.grey[500]),
            const SizedBox(
              height: 4,
            ),
            Text(
              text,
              style: TextStyle(
                  color: selected ? Colors.white : Colors.grey[500],
                  fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
