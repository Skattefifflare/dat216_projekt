import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderButton extends StatelessWidget {
  final IconData icon;
  final String? target;
  final String? text;

  const HeaderButton({required this.icon, this.text, this.target, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [Icon(icon, size: AppTheme.headerButton)];

    if (text != null) {
      content.add(Text(text!, style: TextStyle(fontSize: AppTheme.fontHuge)));
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: (text == null) ? CircleBorder() : null,
        padding: .all(AppTheme.paddingLarge),
      ),

      onPressed: () {
        if (target != null) {
          context.go(target!);
        }
      },
      child: Row(children: content),
    );
  }
}
