import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/widgets/profile/name_field_with_button.dart';
import 'package:dat216_projekt/widgets/profile/password.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool _isEditing = false;


  void _enableEditing() {
    setState(() {
      _isEditing = true;
    });
  }

  void _saveUpdates() {
    setState(() {
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600,),
        child: Card(
          color: theme.surfaceContainerHighest,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
            side: BorderSide(color: theme.primary, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.paddingMedium),
            child: Column(
              children: [
                Row(
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
                          enabled: _isEditing,
                        ),
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
                          enabled: _isEditing,
                        ),
                        SizedBox(
                          width: 250,
                          child: Divider(
                            thickness: AppTheme.strokeTiny,
                            color: theme.secondary,
                          ),
                        ),
                        NameFieldWithButton(
                          label: "E-post",
                          hintTxt: "example@gmail.com",
                          enabled: _isEditing,
                        ),
                        SizedBox(
                          width: 250,
                          child: Divider(
                            thickness: AppTheme.strokeTiny,
                            color: theme.secondary,
                          ),
                        ),
                        PasswordField(
                          labelText: "Lösenord",
                          enabled: _isEditing,
                          hintTxt: "******",
                        ),
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
                          enabled: _isEditing,
                        ),
                        const SizedBox(height: AppTheme.paddingSmall),
                        SizedBox(
                          width: 250,
                          child: Divider(
                            thickness: AppTheme.strokeTiny,
                            color: theme.secondary,
                          ),
                        ),
                        NameFieldWithButton(
                          label: "Utgångsdatum",
                          hintTxt: "12/34",
                          enabled: _isEditing,
                        ),
                        const SizedBox(height: AppTheme.paddingSmall),
                        SizedBox(
                          width: 250,
                          child: Divider(
                            thickness: AppTheme.strokeTiny,
                            color: theme.secondary,
                          ),
                        ),
                        NameFieldWithButton(
                          label: "CVC",
                          hintTxt: "420",
                          enabled: _isEditing,
                        ),
                        const SizedBox(height: AppTheme.paddingSmall),
                        SizedBox(
                          width: 250,
                          child: Divider(
                            thickness: AppTheme.strokeTiny,
                            color: theme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.paddingLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.secondary,
                        foregroundColor: theme.onSecondary,
                      ),
                      onPressed: _isEditing ? null : _enableEditing,
                      child: const Text('Ändra uppgifter'),
                    ),
                    const SizedBox(width: AppTheme.paddingMedium),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.secondary,
                        foregroundColor: theme.onSecondary,
                      ),
                      onPressed: _isEditing ? _saveUpdates : null,
                      child: const Text('Spara uppgifter'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}