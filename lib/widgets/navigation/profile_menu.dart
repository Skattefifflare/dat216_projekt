import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/appIconButton.dart';
import 'package:dat216_projekt/widgets/overlay/overlay_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        AppIconButton(
          text: 'Profil',
          icon: Icons.person_outline,
          onPressed: () {
            OverlayController.close();
            context.go('/profile');
          },
        ),
        SizedBox(height: AppTheme.paddingLarge),
        AppIconButton(
          text: 'Historik',
          icon: Icons.history,
          onPressed: () {
            OverlayController.close();
            context.go('/history');
          },
        ),
      ],
    );
  }
}
