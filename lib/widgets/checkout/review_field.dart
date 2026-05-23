import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class ReviewField extends StatefulWidget {
  final String label;
  final String intitialVal;
  final Function(String) onSave;
  final double width;

  const ReviewField({
    super.key,
    required this.label,
    required this.intitialVal,
    required this.onSave, required this.width,
  });

  @override
  State<ReviewField> createState() => _ReviewFieldState();
}

class _ReviewFieldState extends State<ReviewField> {
  final _addressController = TextEditingController();
  bool canEdit = false;
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
                  border: OutlineInputBorder(),
                  suffixIcon: !canEdit ? Icon(Icons.lock) : Icon(Icons.lock_open),
                ),
                readOnly: !canEdit,
              ),
            ),
            Padding(padding: EdgeInsetsGeometry.only(left: AppTheme.paddingMedium)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: canEdit
                    ? AppTheme.colorScheme.primary
                    : Colors.pink,
              ),
              onPressed: (() {
                setState(() {
                  if (canEdit) {
                    widget.onSave(_addressController.text);
                    canEdit = false;
                  } else {
                    canEdit = true;
                  }
                });
              }),
              child: Text(
                canEdit ? "Spara" : "Ändra",
                style: TextStyle(color: AppTheme.colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
