import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/checkout/misc/checkout_panel.dart';
import 'package:dat216_projekt/widgets/checkout/misc/navigation_button.dart';
import 'package:dat216_projekt/widgets/checkout/review_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryReview extends StatelessWidget {
  const DeliveryReview({super.key});

  @override
  Widget build(BuildContext context) {
    final customer = context.read<ImatDataHandler>().getCustomer();

    Widget left = Column(
      children: [
        Text(
          "Välj Leveransdatum",
          style: AppTheme.textMediumSerif(),
        ),
        Divider(thickness: 1),
        CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1),
          onDateChanged: (context) {},
        ),
      ],
    );

    Widget right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppTheme.paddingMedium,),
        ReviewField(
          label: "Adress",
          intitialVal: customer.address,
          onSave: (String value) {
            customer.address = value;
            context.read<ImatDataHandler>().setCustomer(customer);
          },
          width: 300,
        ),
        SizedBox(height: AppTheme.paddingMedium,),
        Divider(thickness: AppTheme.strokeTiny),
        SizedBox(height: AppTheme.paddingSmall,),
        ReviewField(
          label: "Postkod",
          intitialVal: customer.postCode,
          onSave: (String value) {
            customer.postCode = value;
            context.read<ImatDataHandler>().setCustomer(customer);
          },
          width: 300,
        ),
        SizedBox(height: AppTheme.paddingMedium,),
        Divider(thickness: AppTheme.strokeTiny),
        SizedBox(height: AppTheme.paddingSmall,),
        ReviewField(
          label: "Postadress",
          intitialVal: customer.postAddress,
          onSave: (String value) {
            customer.postAddress = value;
            context.read<ImatDataHandler>().setCustomer(customer);
          },
          width: 300,
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
        ),
      ],
    );

    return CheckoutPanel(leftPanel: left, rightPanel: right);
  }
}
