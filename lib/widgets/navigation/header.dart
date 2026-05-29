import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
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
    final iMat = context.watch<ImatDataHandler>();
    final filterState = context.read<FilterHandler>();

    final colorTheme = Theme.of(context).colorScheme;

    return Container(
      color: colorTheme.primary,
      padding: .all(AppTheme.headerPadding),
      child: Row(
        children: [
          GestureDetector(
            behavior: .opaque,
            onTap: () => context.go('/'),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: AppTheme.headerHeight - AppTheme.headerPadding * 2,
                  ),
                  const SizedBox(width: AppTheme.paddingSmall),
                  Baseline(
                    baselineType: TextBaseline.alphabetic,
                    baseline: AppTheme.headerHeight / 2,
                    child: Text(
                      "iMat",
                      style: AppTheme.textLogo(color: colorTheme.onPrimary),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppTheme.paddingMedium),
          HeaderButton(
            icon: Icons.shelves,
            text: 'Handla nu',
            onPressed: () {
              if (GoRouterState.of(context).uri.toString() == '/browse') {
                filterState.reset();
              } else {
                context.go('/browse');
              }
            },
          ),
          Spacer(),
          Badge(
            backgroundColor: colorTheme.tertiary,
            alignment: const Alignment(-1, 0.6),
            label: Text(
              iMat
                  .getShoppingCart()
                  .items
                  .fold<double>(0, (sum, item) => sum + item.amount)
                  .truncate()
                  .toString(),
              style: AppTheme.textLargeNormal(color: colorTheme.onTertiary),
            ),
            child: HeaderButton(
              icon: Icons.shopping_cart_outlined,
              onPressed: () => OverlayController.open(
                context,
                width: AppTheme.cartWidth,
                child: const Cart(),
              ),
            ),
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
