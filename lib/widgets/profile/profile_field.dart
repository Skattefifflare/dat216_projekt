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
  final bool Function(String) formatCheck;
  final String errorText;
  final Function(String)? onChanged;

  const ProfileField({
    super.key,
    this.label = 'Lösenord',
    required this.intitialVal,
    required this.onSave,
    required this.enabled,
    required this.hintTxt,
    this.width = 250,
    this.obscureText = false,
    required this.formatCheck,
    required this.errorText,
    this.onChanged,
  });

  @override
  ProfileFieldState createState() => ProfileFieldState();
}

class ProfileFieldState extends State<ProfileField> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.intitialVal;
    _errorText = widget.formatCheck(_controller.text) ? null : widget.errorText;
  }

  @override
  void didUpdateWidget(covariant ProfileField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.intitialVal != widget.intitialVal && !widget.enabled) {
      _controller.text = widget.intitialVal;
      _errorText = widget.formatCheck(_controller.text) ? null : widget.errorText;
    }
  }

  bool validate(String value) {
    final isValid = widget.formatCheck(value);
    setState(() {
      _errorText = value.isEmpty ? null : (isValid ? null : widget.errorText);
    });
    return isValid;
  }

  void save() {
    if (validate(_controller.text)) {
      widget.onSave(_controller.text);
    }
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
            child: TextField(
              style: AppTheme.textMediumNormal(),
              controller: _controller,
              enabled: widget.enabled,
              textAlign: TextAlign.center,
              obscureText: widget.obscureText,
              obscuringCharacter: '*',
              onChanged: (value) {
                if (widget.enabled) {
                  validate(value);
                }
                widget.onChanged?.call(value);
              },
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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  borderSide: BorderSide(
                    color: theme.secondary,
                    width: AppTheme.strokeTiny,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  borderSide: BorderSide(
                    color: theme.primary,
                    width: AppTheme.strokeSmall,
                  ),
                ),
              ),
            ),
          ),
          if (_errorText != null && _errorText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                _errorText!,
                style: AppTheme.textSmall(color: theme.error),
              ),
            ),
        ],
      ),
    );
  }
}
