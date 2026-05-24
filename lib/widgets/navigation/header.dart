import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/cart/cart.dart';
import 'package:dat216_projekt/widgets/navigation/header_button.dart';
import 'package:dat216_projekt/widgets/navigation/profile_menu.dart';
import 'package:dat216_projekt/widgets/overlay/overlay_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(AppTheme.headerHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final iMat = context.watch<ImatDataHandler>();
    final colorTheme = Theme.of(context).colorScheme;

    return Container(
      color: colorTheme.primary,
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
          Stack(
            children: [
              HeaderButton(
                icon: Icons.shopping_cart_outlined,
                onPressed: () => OverlayController.open(
                  context,
                  width: AppTheme.cartWidth,
                  child: Cart(),
                ),
              ),
              Positioned(
                bottom: -5,
                left: 0,
                child: Container(
                  padding: .all(AppTheme.paddingTiny),
                  decoration: BoxDecoration(
                    color: theme.tertiary,
                    shape: .circle,
                    border: .all(
                      width: AppTheme.strokeMedium,
                      color: colorTheme.primary,
                    ),
                  ),
                  child: Text(
                    iMat
                        .getShoppingCart()
                        .items
                        .fold<double>(0, (sum, item) => sum + item.amount)
                        .toString(),
                    style: AppTheme.textMediumThin(color: theme.onPrimary)
                  ),
                ),
              ),
            ],
          ),
          HeaderButton(
            icon: Icons.person_outline,
            onPressed: () => OverlayController.open(
              context,
              width: AppTheme.profileMenuWidth,
              child: ProfileMenu(),
            ),
          ),       
        ],
      ),
    );
  }
}
