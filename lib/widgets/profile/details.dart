import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/profile/name_field_with_button.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Card(
      color: theme.surfaceContainerHighest,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        side: BorderSide(color: theme.primary, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingMedium),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameFieldWithButton(
                  label: "Namn",
                  hintTxt: "Hjördis Efternamnsson",
                ),
                const SizedBox(height: AppTheme.paddingSmall),
                const Divider(),
              ],
            ),
            const SizedBox(width: AppTheme.paddingLarge),
            Container(
              width: AppTheme.strokeSmall,
              color: theme.secondary,
              margin: const EdgeInsets.symmetric(
                horizontal: AppTheme.paddingMedium,
              ),
              height: 350,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameFieldWithButton(
                  label: "Kortnummer",
                  hintTxt: "9999 9999 9999 9999",
                ),
                const SizedBox(height: AppTheme.paddingSmall),
                SizedBox(
                  width: 250,
                  child: Divider(
                    thickness: AppTheme.strokeTiny,
                    color: theme.secondary,
                  ),
                ),
                NameFieldWithButton(label: "Utgångsdatum", hintTxt: "12/34"),
                const SizedBox(height: AppTheme.paddingSmall),
                SizedBox(
                  width: 250,
                  child: Divider(
                    thickness: AppTheme.strokeTiny,
                    color: theme.secondary,
                  ),
                ),
                NameFieldWithButton(label: "CVC", hintTxt: "420"),
                const SizedBox(height: AppTheme.paddingSmall),
                SizedBox(
                  width: 250,
                  child: Divider(
                    thickness: AppTheme.strokeTiny,
                    color: theme.secondary,
                  ),
                ),
                NameFieldWithButton(
                  label: "Telefonnummer",
                  hintTxt: "+46 999 999 99 99",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
