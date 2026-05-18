import 'package:dat216_projekt/app_assets.dart';
import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/profile/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class Profile extends StatelessWidget {
  @Preview(name: 'My Sample Text')
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
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
        SizedBox(height: AppTheme.paddingMediumSmall),
        Text('Hjördis', style: TextStyle(fontSize: AppTheme.fontGiant)),
        SizedBox(height: AppTheme.paddingHuge),
        Details(),
      ],
    );
  }
}
