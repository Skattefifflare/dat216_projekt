import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/footer.dart';
import 'package:dat216_projekt/widgets/navigation/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BaseView({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const .all(AppTheme.edgePadding),
        child: navigationShell,
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
