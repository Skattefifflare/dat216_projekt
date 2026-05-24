import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/internet_handler.dart';
import 'package:flutter/material.dart';

class ConfirmationReview extends StatelessWidget {
  const ConfirmationReview({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: AppTheme.paddingMedium,),
        Text("Tack för din beställning!", style: AppTheme.textGiantThick(),)
      ],
    );
  }
}