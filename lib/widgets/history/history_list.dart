import 'dart:convert';

import 'package:dat216_projekt/model/internet_handler.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {

  List orders = [];

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    String response = await InternetHandler.getOrders();

    if (response.isNotEmpty) {
      setState(() {
        orders = jsonDecode(response);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: orders.length,
        itemBuilder: (context, index) {
          var order = orders[index];
          return ListTile(
            title: Text('Order ID: ${order['id']}'),
            subtitle: Text('Total: ${order['total']}'),
          );
        },
      ),
    );
  }
}