import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/widgets/browse/filter/filter_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LabelCheckbox extends StatelessWidget {
  final String text;
  final String label;

  const LabelCheckbox({super.key, required this.text, required this.label});

  @override
  Widget build(BuildContext context) {
    final filterState = context.watch<FilterHandler>();

    return FilterCheckbox(
      text: text,
      onChanged: (_) {
        filterState.toggleLabel(label);
      },
      enabled: filterState.labels.contains(label),
    );
  }
}
