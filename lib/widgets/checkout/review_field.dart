import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class ReviewField extends StatefulWidget {
  final String label;
  final String intitialVal;
  final Function(String) onSave;
  final double width;
  final bool Function(String) checkFormat;
  final String errorMessage;

  const ReviewField({
    super.key,
    required this.label,
    required this.intitialVal,
    required this.onSave,
    required this.width,
    required this.checkFormat,
    required this.errorMessage,
  });

  @override
  State<ReviewField> createState() => _ReviewFieldState();
}

class _ReviewFieldState extends State<ReviewField> {
  final _addressController = TextEditingController();
  bool canEdit = false;
  bool showError = false;
  @override
  void initState() {
    super.initState();
    _addressController.text = widget.intitialVal;
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        Row(
          children: [
            SizedBox(
              width: widget.width,
              child: TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.colorScheme.outline,
                      width: 2,
                    ),
                  ),
                  suffixIcon: !canEdit
                      ? Icon(Icons.lock)
                      : Icon(Icons.lock_open),
                ),
                readOnly: !canEdit,
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(left: AppTheme.paddingSmall),
            ),
            SizedBox(
              width: 88,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: canEdit
                      ? AppTheme.colorScheme.primary
                      : AppTheme.colorScheme.tertiary,
                ),
                onPressed: (() {
                  setState(() {
                    if (canEdit) {
                      widget.onSave(_addressController.text);
                      canEdit = false;
                    } else {
                      canEdit = true;
                    }

                    if (widget.checkFormat(_addressController.text)){
                      showError = false;
                    }
                    else{
                      showError = true;
                    }
                  });
                }),
                child: Text(
                  canEdit ? "Spara" : "Ändra",
                  style: TextStyle(color: AppTheme.colorScheme.onPrimary),
                ),
              ),
            ),
            
          ],
        ),
        Text(
              showError
                  ? widget.errorMessage
                  : "",
              style: AppTheme.textSmall(color: AppTheme.colorScheme.error),
            ),
      ],
    );
  }
}
