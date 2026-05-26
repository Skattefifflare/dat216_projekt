import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileField extends StatefulWidget {
  final String label;
  final String intitialVal;
  final Function(String) onSave;
  final bool enabled;
  final String hintTxt;
  final double width;
  final bool obscureText;


  const ProfileField({
    super.key,
    this.label = 'Lösenord',
    required this.intitialVal,
    required this.onSave,
    required this.enabled,
    required this.hintTxt,
    this.width = 250,
    this.obscureText = false,
  });

  @override
  ProfileFieldState createState() => ProfileFieldState();
}

class ProfileFieldState extends State<ProfileField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.intitialVal;
  }

  @override
  void didUpdateWidget(covariant ProfileField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.intitialVal != widget.intitialVal && !widget.enabled) {
      _controller.text = widget.intitialVal;
    }
  }

  void save() {
    widget.onSave(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.paddingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            textAlign: TextAlign.left,
            style: AppTheme.textMediumNormal(),
          ),
          SizedBox(
            width: widget.width,
            height: 38,
            child: TextField(
              style: AppTheme.textMediumNormal(),
              controller: _controller,
              enabled: widget.enabled,
              textAlign: TextAlign.center,
              obscureText: widget.obscureText,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                hintText: widget.hintTxt,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                
              
                ),
                fillColor: theme.surface,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  borderSide: BorderSide(
                    color: theme.secondary,
                    width: AppTheme.strokeTiny,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
