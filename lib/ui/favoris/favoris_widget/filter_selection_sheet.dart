import 'package:flutter/material.dart';

class FilterSelectionSheet extends StatelessWidget {
  final Function(String) onFilterCategorySelected;

  const FilterSelectionSheet({super.key, required this.onFilterCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Choose a filter category",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text("Subtype"),
            onTap: () {
              onFilterCategorySelected("Subtype");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Type"),
            onTap: () {
              onFilterCategorySelected("Type");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Supertype"),
            onTap: () {
              onFilterCategorySelected("Supertype");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
