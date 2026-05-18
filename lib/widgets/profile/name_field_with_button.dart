import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class NameFieldWithButton extends StatelessWidget {
  final String label;
  final String hintTxt;

  const NameFieldWithButton({
    super.key,
    required this.label,
    required this.hintTxt,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.paddingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: AppTheme.fontMedium),
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 32,
                child: TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: hintTxt,
                    fillColor: theme.surface,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppTheme.radiusMedium,
                      ),
                      borderSide: BorderSide(
                        color: theme.secondary,
                        width: AppTheme.strokeTiny,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppTheme.paddingMedium),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.tertiary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                  ),
                ),
                child: Text('Ändra', style: TextStyle(color: theme.surface)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
