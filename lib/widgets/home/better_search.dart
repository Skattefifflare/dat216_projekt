import 'package:dat216_projekt/app_theme.dart';
import 'package:dat216_projekt/model/filter_handler.dart';
import 'package:dat216_projekt/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BetterSearch extends StatelessWidget {
  const BetterSearch({super.key});

  static OverlayEntry? _overlayEntry;
  static final LayerLink _layerLink = LayerLink();

  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: AppTheme.contentMaxWidth,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60),
          child: const SuggestionsList(),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _handleSearchChange(
    BuildContext context,
    String value,
    FilterHandler filterState,
  ) {
    filterState.searchString = value;

    if (GoRouterState.of(context).uri.toString() == '/browse' ||
        value.isEmpty) {
      _hideOverlay();
    } else {
      _showOverlay(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentSearchString = context.watch<FilterHandler>().searchString;
    final filterState = context.read<FilterHandler>();

    return SizedBox(
      width: AppTheme.contentMaxWidth,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Card(
          child: TextField(
            controller: TextEditingController.fromValue(
              TextEditingValue(
                text: currentSearchString,
                selection: TextSelection.collapsed(
                  offset: currentSearchString.length,
                ),
              ),
            ),
            onChanged: (value) =>
                _handleSearchChange(context, value, filterState),
            onSubmitted: (value) {
              filterState.searchString = value;
              _hideOverlay();

              if (GoRouterState.of(context).uri.toString() != '/browse') {
                context.go('/browse');
              }
            },
            decoration: InputDecoration(
              hintText: 'Sök efter produkter här',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _handleSearchChange(context, '', filterState);
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
      ),
    );
  }
}

class SuggestionsList extends StatelessWidget {
  const SuggestionsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch for search changes
    final _ = context.watch<FilterHandler>().searchString;

    final filterState = context.watch<FilterHandler>();
    final iMat = context.watch<ImatDataHandler>();

    final query = filterState.searchString;

    final suggestions = query.isEmpty
        ? []
        : iMat.findProducts(query).map((p) => p.name).toList();

    if (suggestions.isEmpty) return const SizedBox.shrink();

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
                onTap: () {
                  filterState.reset();
                  filterState.searchString = suggestions[index];
                  context.go('/browse');
                },
                child: ListTile(
                  tileColor: Colors.white,
                  title: Text(suggestions[index]),
                ),
              ),
              const Divider(height: 1),
            ],
          ),
        ),
      ),
    );
  }
}
