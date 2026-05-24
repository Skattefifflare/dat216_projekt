import 'package:dat216_projekt/app_theme.dart';
import 'package:flutter/material.dart';

class Adress extends StatefulWidget {
  const Adress({super.key});

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  final List<TextEditingController> _controllers = [];
  final List<TextEditingController> _titleControllers = [];
  final ScrollController _scrollController = ScrollController();

  void _addAdress() {
    setState(() {
      _controllers.add(TextEditingController());
      _titleControllers.add(TextEditingController());
    });
  }

  void _removeAdress(int index) {
    setState(() {
      _controllers[index].dispose();
      _titleControllers[index].dispose();
      _controllers.removeAt(index);
      _titleControllers.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final titleController in _titleControllers) {
      titleController.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      width: 400,
      constraints: const BoxConstraints(minHeight: 360, maxHeight: 560),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        border: Border.all(color: theme.primary, width: AppTheme.strokeSmall),
      ),
      padding: const EdgeInsets.fromLTRB(
        AppTheme.paddingMedium,
        AppTheme.paddingMedium,
        AppTheme.paddingLarge,
        AppTheme.paddingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Lägg till Adress', style: AppTheme.textMediumNormal()),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: theme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  ),
                ),
                onPressed: _addAdress,
                tooltip: 'Lägg till Adress',
              ),
            ],
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          Expanded(
            // text om adresser är tomma
            child: _controllers.isEmpty
                ? Center(
                    child: Text(
                      'Tryck på + för att lägga till en adress',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.onSurfaceVariant),
                    ),
                  )
                  //Scrollbar för adresser
                : ScrollbarTheme(
                    data: ScrollbarThemeData(
                      thumbColor: .all(theme.primary),
                      trackVisibility: .all(true),
                      thickness: .all(8),
                      radius: const Radius.circular(8),
                    ),
                    child: Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      trackVisibility: true,
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.only(right: AppTheme.paddingMedium),
                        itemCount: _controllers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: AppTheme.paddingSmall),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: theme.primary.withValues(alpha: 0.25), width: AppTheme.strokeTiny),
                              ),
                              padding: const EdgeInsets.all(AppTheme.paddingMedium),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: _titleControllers[index],
                                    decoration: InputDecoration(
                                      hintText: 't.ex Hemma',
                                      filled: true,
                                      fillColor: Colors.grey.shade100,
                                      contentPadding: const EdgeInsets.symmetric(
                                        vertical: AppTheme.paddingSmall,
                                        horizontal: AppTheme.paddingMedium,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: theme.primary.withValues(alpha: 0.35), width: AppTheme.strokeTiny),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: theme.primary.withValues(alpha: 0.25), width: AppTheme.strokeTiny),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: theme.primary, width: AppTheme.strokeSmall),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: AppTheme.paddingSmall),
                                  Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: _controllers[index],
                                        decoration: InputDecoration(
                                          hintText: 'Adress',
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(24),
                                            borderSide: BorderSide(color: theme.primary, width: AppTheme.strokeTiny),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(24),
                                            borderSide: BorderSide(color: theme.primary.withOpacity(0.5), width: AppTheme.strokeTiny),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(24),
                                            borderSide: BorderSide(color: theme.primary, width: AppTheme.strokeMedium),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: AppTheme.paddingSmall),
                                    // Ta bort-knapp
                                    IconButton(
                                      icon: Image.asset(
                                        'assets/images/Trashcan.jpg',
                                        width: 20,
                                        height: 20,
                                      ),
                                      style: IconButton.styleFrom(
                                        backgroundColor: theme.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                                        ),
                                      ),
                                      onPressed: () => _removeAdress(index),
                                      tooltip: 'Ta bort adress',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  } 
}