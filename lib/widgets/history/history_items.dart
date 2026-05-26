import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class HistoryItems extends StatelessWidget {
  final List items;
  final String orderID;

  const HistoryItems({super.key, required this.items, required this.orderID});

  @override
  Widget build(BuildContext context) {
    final double total = items.fold(0, (sum, item) => sum + item['total']);

    return Container(
      constraints: const BoxConstraints(maxWidth: 616),
      padding: const EdgeInsets.all(AppTheme.paddingMedium),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Orderdetaljer",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "ID: $orderID",
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
          const SizedBox(height: 16),
          Divider(
            height: 30,
            thickness: 1,
            color: AppTheme.colorScheme.secondary,
          ),
          const SizedBox(height: 10),

          ...items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${item['product']['name']} x ${item['amount']}",
                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                  Text("${item['total'].toStringAsFixed(2)} kr"),
                ],
              ),
            );
          }),

          Divider(
            height: 30,
            thickness: 1,
            color: AppTheme.colorScheme.secondary,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "${total.toStringAsFixed(2)} kr",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.colorScheme.tertiary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Stäng"),
            ),
          ),
        ],
      ),
    );
  }
}
