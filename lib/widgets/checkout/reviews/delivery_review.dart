import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/checkout/checkout_navigation.dart';
import 'package:dat216_projekt/widgets/checkout/misc/checkout_panel.dart';
import 'package:dat216_projekt/widgets/checkout/misc/navigation_button.dart';
import 'package:dat216_projekt/widgets/checkout/review_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryReview extends StatefulWidget {
  const DeliveryReview({super.key});

  @override
  State<DeliveryReview> createState() => _DeliveryReviewState();
}

class _DeliveryReviewState extends State<DeliveryReview> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // set initial delivery date in the navigation provider
      context.read<CheckoutNavigation>().setDeliveryDate(DateTime.now());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final customer = context.watch<ImatDataHandler>().getCustomer();
    CheckoutNavigation navigation = context.watch<CheckoutNavigation>();
    Widget left = Column(
      children: [
        Text(
          "Välj Leveransdatum",
          style: AppTheme.textLargeThick(),
        ),
        Divider(thickness: 1),
        CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1),
          onDateChanged: (DateTime date) {
            navigation.setDeliveryDate(date);
          },
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
            context.watch<ImatDataHandler>().setCustomer(customer);
          },
          checkFormat: (String value){
            if (value.isNotEmpty) return true;
            return false;
          },
          errorMessage: "Fyll i textfältet med address",
          width: 250,
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
          checkFormat: (String value){
            if (value.isNotEmpty) return true;
            return false;
          },
          errorMessage: "Fyll i textfältet med postkod",
          width: 250,
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
          checkFormat: (String value){
            if (value.isNotEmpty) return true;
            return false;
          },
          errorMessage: "Fyll i textfältet med postaddress",
          width: 250,
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
