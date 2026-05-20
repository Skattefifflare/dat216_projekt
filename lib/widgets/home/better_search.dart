import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BetterSearch extends StatefulWidget {
  const BetterSearch({super.key});

  @override
  State<BetterSearch> createState() => _BetterSearchState();
}

class _BetterSearchState extends State<BetterSearch> {
  final TextEditingController _searchController = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _showOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 960,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, 60), // höjden på sökfältet
          child: SuggestionsList(query: _searchController.text),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  void change(String? value) {
    setState(() {});
    if (value == null || value.isEmpty) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } else {
      _showOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 960,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Column(
          children: [
            Card(
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  change(value);
                },
                decoration: InputDecoration(
                  hintText: 'Sök efter produkter här',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      change(null);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuggestionsList extends StatefulWidget {
  final String query;
  const SuggestionsList({super.key, required this.query});

  @override
  State<SuggestionsList> createState() => _SuggestionsListState();
}

class _SuggestionsListState extends State<SuggestionsList> {
  List<String> suggestions = [];
  late final ImatDataHandler imat;

  @override
  void initState() {
    super.initState();
    imat = context.read<ImatDataHandler>();
    imat.addListener(_onDataChanged);
    if (widget.query.isNotEmpty) {
      updateSuggestions(widget.query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Material(
        color: const Color.fromARGB(45, 255, 255, 255),
        child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) => Column(
            children: [
              InkWell(
                hoverColor: Colors.amber,
                onTap: () => {},
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(suggestions[index]),
                ),
              ),
              Divider(height: 1),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(SuggestionsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.query != oldWidget.query) {
      updateSuggestions(widget.query);
    }
  }

  void updateSuggestions(String query) {
    setState(() {
      suggestions.clear();
      suggestions.addAll(imat.findProducts(query).map((p) => p.name));
    });
  }

  void _onDataChanged() {
    if (widget.query.isNotEmpty) {
      updateSuggestions(widget.query);
    }
  }

  @override
  void dispose() {
    imat.removeListener(_onDataChanged);
    super.dispose();
  }
}
