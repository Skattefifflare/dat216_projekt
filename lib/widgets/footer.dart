import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppTheme.footerHeight,
      child: Center(
        child: Text('© 2026 iMat. All rights reserved.'),
      ),
    );
  }
}