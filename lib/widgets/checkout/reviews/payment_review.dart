import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/checkout/misc/vert_divide.dart';
import 'package:dat216_projekt/widgets/checkout/misc/navigation_button.dart';
import 'package:dat216_projekt/widgets/checkout/review_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentReview extends StatelessWidget {
  const PaymentReview({super.key});

  @override
  Widget build(BuildContext context) {
    final creditCard = context.read<ImatDataHandler>().getCreditCard();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReviewField(
                label: "Korttyp",
                intitialVal: creditCard.cardType,
                onSave: (String value) {
                  creditCard.cardType = value;
                  context.read<ImatDataHandler>().setCreditCard(creditCard);
                },
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppTheme.paddingMedium,
                  bottom: AppTheme.paddingMedium,
                ),
                child: SizedBox(width: 400, child: Divider(thickness: 2)),
              ),
              ReviewField(
                label: "Innehavare",
                intitialVal: creditCard.holdersName,
                onSave: (String value) {
                  creditCard.holdersName = value;
                  context.read<ImatDataHandler>().setCreditCard(creditCard);
                },
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppTheme.paddingMedium,
                  bottom: AppTheme.paddingMedium,
                ),
                child: SizedBox(width: 400, child: Divider(thickness: 2)),
              ),
              ReviewField(
                label: "Kortnummer",
                intitialVal: creditCard.cardNumber,
                onSave: (String value) {
                  creditCard.cardNumber = value;
                  context.read<ImatDataHandler>().setCreditCard(creditCard);
                },
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppTheme.paddingMedium,
                  bottom: AppTheme.paddingMedium,
                ),
                child: SizedBox(width: 400, child: Divider(thickness: 2)),
              ),
              Row(
                children: [
                  ReviewField(
                    label: "Utgångsår",
                    intitialVal: creditCard.validYear.toString(),
                    onSave: (String value) {
                      creditCard.validYear = int.parse(value);
                      context.read<ImatDataHandler>().setCreditCard(creditCard);
                    },
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppTheme.paddingMedium,
                      right: AppTheme.paddingMedium,
                    ),
                    child: SizedBox(
                      height: 60,
                      child: VerticalDivider(thickness: 2),
                    ),
                  ),
                  ReviewField(
                    label: "Utgångsmånad",
                    intitialVal: creditCard.validMonth.toString(),
                    onSave: (String value) {
                      creditCard.validMonth = int.parse(value);
                      context.read<ImatDataHandler>().setCreditCard(creditCard);
                    },
                    width: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
        VertDivide(),
        SizedBox(
          width: 500,
          child: Column(children: [NavigationButton(goesForward: false, width: 300,)]),
        ),
      ],
    );
  }
}
