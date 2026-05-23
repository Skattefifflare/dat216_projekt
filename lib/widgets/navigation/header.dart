import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/navigation/header_button.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      color: theme.primary,
      padding: .all(AppTheme.headerPadding),
      child: Row(
        children: [
          //TODO Logo
          Placeholder(fallbackWidth: 120),
          HeaderButton(
            icon: Icons.shelves,
            target: '/browse',
            text: 'Handla nu',
          ),
          Spacer(),
          //TODO Search bar
          Spacer(),
          HeaderButton(icon: Icons.shopping_cart_outlined),
          HeaderButton(icon: Icons.person_outline, target: '/profile'),
          HeaderButton(icon: Icons.car_crash, target: '/checkout'), //temp för att komma till leverans
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppTheme.headerHeight);
}
