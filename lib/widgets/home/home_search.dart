import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final TextEditingController _controller = TextEditingController();
  String query = "";

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return SizedBox(
      width: AppTheme.contentMaxWidth,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: "Sök efter produkter här",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _controller.clear();
              setState(() => query = '');
            },
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppTheme.paddingMedium,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: theme.surfaceContainerHighest,
        ),
        onChanged: (value) => setState(() => query = value),
      ),
    );
  }
}
