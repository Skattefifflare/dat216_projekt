import 'dart:convert';

import 'package:dat216_projekt/model/internet_handler.dart';
import 'package:flutter/material.dart';
import "package:dat216_projekt/widgets/history/history_card.dart";

class HistoryList extends StatefulWidget {
  final Function(int)? onCountChanged;
  const HistoryList({super.key, this.onCountChanged});

  @override
  State<HistoryList> createState() => HistoryListState();
}

class HistoryListState extends State<HistoryList> {
  List orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void sortOrders(bool isAscending) {
    setState(() {
      orders.sort((a, b) {
        return isAscending
            ? a['date'].compareTo(b['date'])
            : b['date'].compareTo(a['date']);
      });
    });
  }

  Future<void> fetchOrders() async {
    String response = await InternetHandler.getOrders();

    if (response.isNotEmpty) {
      final List decodedData = jsonDecode(response);

      setState(() {
        orders = decodedData;
        widget.onCountChanged?.call(orders.length);
      });
      sortOrders(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        var order = orders[index];
        return HistoryCard(
          orderID: ('Order ID: ${order['orderNumber']}'),
          date: (order["date"]),
          items: order['items'],
        );
      },
    );
  }
}
