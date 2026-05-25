import 'package:dat216_projekt/app_assets.dart';
import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/profile/adress.dart';
import 'package:dat216_projekt/widgets/profile/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class Profile extends StatelessWidget {
  @Preview(name: 'My Sample Text')
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.paddingLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.primary,
                width: AppTheme.strokeMedium,
              ),
            ),
            child: CircleAvatar(
              radius: AppTheme.profilePictureSize,
              backgroundImage: AssetImage(AppAssets.profile),
            ),
          ),
          const SizedBox(height: AppTheme.paddingMediumSmall),
          Text('Hjördis', style: AppTheme.textHuge()),
          const SizedBox(height: AppTheme.paddingHuge),
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 980;
              return Flex(
                direction: isNarrow ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Details(),
                   SizedBox(width: isNarrow ? 0 : AppTheme.paddingLarge, height: isNarrow ? AppTheme.paddingLarge : 0),
                   const Adress(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}