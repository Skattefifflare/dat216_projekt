import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/cart/cart.dart';
import 'package:dat216_projekt/widgets/navigation/header_button.dart';
import 'package:dat216_projekt/widgets/overlay/overlay_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(AppTheme.headerHeight);

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
            text: 'Handla nu',
            onPressed: () => context.go('/browse'),
          ),
          Spacer(),
          //TODO Search bar
          Spacer(),
          HeaderButton(
            icon: Icons.shopping_cart_outlined,
            onPressed: () => OverlayController.open(
              context,
              width: AppTheme.cartWidth,
              child: Cart(),
            ),
          ),
          HeaderButton(
            icon: Icons.person_outline,
            onPressed: () => context.go('/profile'),
          ),
        ],
      ),
    );
  }
}
