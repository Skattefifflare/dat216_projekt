import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/checkout/misc/checkout_panel.dart';
import 'package:dat216_projekt/widgets/checkout/misc/navigation_button.dart';
import 'package:dat216_projekt/widgets/checkout/review_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentReview extends StatefulWidget {
  const PaymentReview({super.key});

  @override
  State<PaymentReview> createState() => _PaymentReviewState();


  
}

class _PaymentReviewState extends State<PaymentReview> {
@override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final creditCard = context.watch<ImatDataHandler>().getCreditCard();

    Widget left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppTheme.paddingMedium,),
        ReviewField(
          label: "Korttyp",
          intitialVal: creditCard.cardType,
          onSave: (String value) {
            creditCard.cardType = value;
            context.read<ImatDataHandler>().setCreditCard(creditCard);
          },
          checkFormat: (String value){
            if (value.isNotEmpty) return true;
            return false;
          },
          errorMessage: "Fyll i textfältet med din korttyp",
          width: 250,
        ),
        SizedBox(height: AppTheme.paddingMedium),
        Divider(thickness: AppTheme.strokeTiny),
        SizedBox(height: AppTheme.paddingSmall),
        ReviewField(
          label: "Innehavare   (för- och efternamn)",
          intitialVal: creditCard.holdersName,
          onSave: (String value) {
            creditCard.holdersName = value;
            context.read<ImatDataHandler>().setCreditCard(creditCard);
          },
          checkFormat: (String value){
            if (value.isNotEmpty) return true;
            return false;
          },
          errorMessage: "Fyll i textfältet med ditt fullständiga namn",
          width: 250,
        ),
        SizedBox(height: AppTheme.paddingMedium),
        Divider(thickness: AppTheme.strokeTiny),
        SizedBox(height: AppTheme.paddingSmall),
        ReviewField(
          label: "Kortnummer",
          intitialVal: creditCard.cardNumber,
          onSave: (String value) {
            creditCard.cardNumber = value;
            context.read<ImatDataHandler>().setCreditCard(creditCard);
          },
          checkFormat: (String value){
            if (value.replaceAll(' ', '').length == 16) return true;
            return false;
          },
          errorMessage: "Skriv kortets 16 siffror",
          width: 250,
        ),
        SizedBox(height: AppTheme.paddingMedium),
        Divider(thickness: AppTheme.strokeTiny),
        SizedBox(height: AppTheme.paddingSmall),
      ],
    );

    Widget right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppTheme.paddingMedium,),
        ReviewField(
          label: "Utgångsår   (2 siffror)",
          intitialVal: creditCard.validYear.toString(),
          onSave: (String value) {
            creditCard.validYear = int.parse(value);
            context.read<ImatDataHandler>().setCreditCard(creditCard);
          },
          checkFormat: (String value){
            if (value.length == 2) return true;
            return false;
          },
          errorMessage: "Skriv utgångsår med 2 siffror",
          width: 100,
        ),
        SizedBox(height: AppTheme.paddingMedium,),
        Divider(thickness: AppTheme.strokeTiny),
        SizedBox(height: AppTheme.paddingSmall,),
        ReviewField(
          label: "Utgångsmånad",
          intitialVal: creditCard.validMonth.toString(),
          onSave: (String value) {
            creditCard.validMonth = int.parse(value);
            context.read<ImatDataHandler>().setCreditCard(creditCard);
          },
          checkFormat: (String value){
            if (value.length == 2) return true;
            return false;
          },
          errorMessage: "Skriv utgångsmånad med 2 siffror",
          width: 100,
        ),
        SizedBox(height: AppTheme.paddingMedium,),
        Divider(thickness: AppTheme.strokeTiny),
        SizedBox(height: AppTheme.paddingSmall,),
        ReviewField(
          label: "Verifieringsnummer",
          intitialVal: creditCard.verificationCode.toString(),
          onSave: (String value) {
            creditCard.verificationCode = int.parse(value);
            context.read<ImatDataHandler>().setCreditCard(creditCard);
          },
          checkFormat: (String value){
            if (value.length == 3) return true;
            return false;
          },
          errorMessage: "Skriv verifieringsnummer med 3 siffror",
          width: 100,
        ),
        SizedBox(height: AppTheme.paddingMedium,),
        Divider(thickness: AppTheme.strokeTiny),
        SizedBox(height: AppTheme.paddingSmall,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationButton(goesForward: false, width: 200),
            NavigationButton(goesForward: true, width: 200),
          ],
        )
      ],
    );

    return CheckoutPanel(leftPanel: left, rightPanel: right);
  }
}
