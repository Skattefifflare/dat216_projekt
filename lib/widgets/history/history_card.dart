import 'package:flutter/material.dart';
import "package:dat216_projekt/widgets/history/history_items.dart";

class HistoryCard extends StatefulWidget {
  final String orderID;
  final int date;
  final List items;
  const HistoryCard({
    super.key,
    required this.orderID,
    required this.date,
    required this.items,
  });

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    DateTime formattedDate = DateTime.fromMillisecondsSinceEpoch(widget.date);

    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(38, 0, 0, 0),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                formattedDate.toString().split(' ').first,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(widget.orderID, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SingleChildScrollView(
                    child: HistoryItems(
                      items: widget.items,
                      orderID: widget.orderID,
                    ),
                  ),
                ),
              );
            },
            child: const Row(
              children: [
                Text(
                  'visa varor',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_right, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
