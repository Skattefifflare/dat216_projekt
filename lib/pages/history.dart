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
  int currentPage = 0;
  int itemsPerPage = 5;
  int orderCount = 0;
  bool isAscending = false;

  void _movePage(int delta) {
    setState(() {
      currentPage += delta;
      _scrollController.animateTo(
        currentPage * 580,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = (orderCount / itemsPerPage).ceil();
    return Column(
      children: [
        Text("Historik", style: TextStyle(fontSize: AppTheme.headerHeight)),
        TextButton.icon(
          onPressed: () {
            setState(() {
              isAscending = !isAscending;
              _historyListKey.currentState?.sortOrders(isAscending);
              _movePage(-currentPage);
              currentPage = 0;
            });
          },
          icon: Icon(isAscending ? Icons.arrow_upward : Icons.arrow_downward),
          label: Text(isAscending ? "Äldsta Först" : "Senaste Först"),
        ),

        Container(
          height: 592,
          width: 1250,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.colorScheme.primary, width: 3.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
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

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),

              onPressed: currentPage > 0 ? () => _movePage(-1) : null,
            ),
            Text("Sida ${currentPage + 1} av $totalPages"),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),

              onPressed: currentPage < totalPages - 1
                  ? () => _movePage(1)
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
