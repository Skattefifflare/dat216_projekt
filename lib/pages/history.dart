import 'dart:ui';

import 'package:flutter/material.dart';
import "package:dat216_projekt/widgets/history/history_list.dart";
import 'package:dat216_projekt/app_theme.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final GlobalKey<HistoryListState> _historyListKey =
      GlobalKey<HistoryListState>();
  final ScrollController _scrollController = ScrollController();

  int orderCount = 0;
  bool isAscending = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Historik", style: TextStyle(fontSize: AppTheme.headerHeight)),
        TextButton.icon(
          onPressed: () {
            setState(() {
              isAscending = !isAscending;
              _historyListKey.currentState?.sortOrders(isAscending);
              _scrollController.animateTo(
                _scrollController.position.minScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            });
          },
          icon: Icon(isAscending ? Icons.arrow_upward : Icons.arrow_downward),
          label: Text(isAscending ? "Äldsta Först" : "Senaste Först"),
        ),

        Container(
          height: 421,
          width: 1250,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.colorScheme.primary, width: 3.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ScrollConfiguration(
            behavior: _TrackpadScrollBehavior(),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: HistoryList(
                key: _historyListKey,
                onCountChanged: (count) {
                  setState(() {
                    orderCount = count;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TrackpadScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}