import 'package:flutter/material.dart';
import 'package:verinvest_mobile/core/theme/base_colors.dart';

class MenuOption extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool selected;

  const MenuOption(
      {super.key,
      required this.text,
      required this.iconData,
      required this.selected});

  void onClick() {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: selected ? BaseColors.green[500] : Colors.grey[200],
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: selected
                    ? BaseColors.green[500]!.withOpacity(0.2)
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
