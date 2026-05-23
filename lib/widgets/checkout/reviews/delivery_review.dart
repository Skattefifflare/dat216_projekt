import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:dat216_projekt/widgets/checkout/misc/vert_divide.dart';
import 'package:dat216_projekt/widgets/checkout/navigation_button.dart';
import 'package:dat216_projekt/widgets/checkout/review_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryReview extends StatelessWidget {
  const DeliveryReview({super.key});

  @override
  Widget build(BuildContext context) {
    final customer = context.read<ImatDataHandler>().getCustomer();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 500,
          child: Column(
            children: [
              Text("Välj Leveransdatum:", style: TextStyle(fontSize: AppTheme.fontLarge),),
              Divider(thickness: 2,),
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 1),
                onDateChanged: (context) {},
              ),
            ],
          ),
        ),
    
        VertDivide(),
        SizedBox(
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReviewField(
                label: "Adress",
                intitialVal: customer.address,
                onSave: (String value) {
                  customer.address = value;
                  context.read<ImatDataHandler>().setCustomer(customer);
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
                label: "Postkod",
                intitialVal: customer.postCode,
                onSave: (String value) {
                  customer.postCode = value;
                  context.read<ImatDataHandler>().setCustomer(customer);
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
                label: "Postadress",
                intitialVal: customer.postAddress,
                onSave: (String value) {
                  customer.postAddress = value;
                  context.read<ImatDataHandler>().setCustomer(customer);
                },
                width: 300,
              ),
              SizedBox(height: 100),
              SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavigationButton(goesForward: false),
                    NavigationButton(goesForward: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}