import 'package:flutter/material.dart';

class ThemePreview extends StatelessWidget {
  const ThemePreview({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Define the colors we want to preview
    final colorGroups = [
      _ColorGroup('Primary Group', [
        _ColorItem('Primary', colors.primary, colors.onPrimary),
        _ColorItem('On Primary', colors.onPrimary, colors.primary),
        _ColorItem('Primary Container', colors.primaryContainer, colors.onPrimaryContainer),
      ]),
      _ColorGroup('Secondary & Tertiary', [
        _ColorItem('Secondary', colors.secondary, colors.onSecondary),
        _ColorItem('Secondary Container', colors.secondaryContainer, colors.onSecondaryContainer),
        _ColorItem('Tertiary', colors.tertiary, colors.onTertiary),
      ]),
      _ColorGroup('Surfaces & Backgrounds', [
        _ColorItem('Background', colors.surface, colors.onSurface),
        _ColorItem('Surface', colors.surface, colors.onSurface),
        _ColorItem('Surface Container Highest', colors.surfaceContainerHighest, colors.onSurfaceVariant),
        _ColorItem('Inverse Surface', colors.inverseSurface, colors.onInverseSurface),
      ]),
      _ColorGroup('Content & Outlines', [
        _ColorItem('On Surface', colors.onSurface, colors.surface),
        _ColorItem('On Surface Variant', colors.onSurfaceVariant, colors.surfaceContainerHighest),
        _ColorItem('Outline', colors.outline, colors.surface),
        _ColorItem('Error', colors.error, colors.onError),
      ]),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Design System Color Preview')),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: colorGroups.length,
        itemBuilder: (context, index) {
          final group = colorGroups[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: group.items.map((item) {
                  return Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colors.outline.withOpacity(0.2)),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(color: item.textColor, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          '#${item.color.value.toRadixString(16).substring(2).toUpperCase()}',
                          style: TextStyle(color: item.textColor.withOpacity(0.7), fontSize: 12),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }
}

// Helper classes to structure our preview data cleanly
class _ColorGroup {
  final String title;
  final List<_ColorItem> items;
  _ColorGroup(this.title, this.items);
}

class _ColorItem {
  final String name;
  final Color color;
  final Color textColor;
  _ColorItem(this.name, this.color, this.textColor);
}