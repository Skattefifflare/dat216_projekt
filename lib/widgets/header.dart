import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      color: theme.primary,
      padding: .all(AppTheme.paddingMedium),
      child: Row(
        children: [
          Placeholder(),
          Spacer(),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              context.go('/profile');
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppTheme.headerHeight);
}
