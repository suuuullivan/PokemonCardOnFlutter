import 'package:flutter/material.dart';
import '../../../themes/app_color.dart';

class FavoriteSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onClear;
  final ValueChanged<String>? onChanged;
  final bool isFilterMode;
  final VoidCallback? onFilterPressed;

  const FavoriteSearchBar({
    super.key,
    required this.controller,
    this.hintText = 'Search Favorites',
    required this.onClear,
    this.onFilterPressed,
    this.onChanged,
    this.isFilterMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.cyan10,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(color: AppColor.darkCyan),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                style: const TextStyle(fontSize: 16),
                onChanged: onChanged,
              ),
            ),
            IconButton(
              icon: Icon(
                isFilterMode ? Icons.close : Icons.filter_list, // Croix pour filtre, icône filtre pour favoris
                color: AppColor.darkCyan,
              ),
              onPressed: isFilterMode ? onClear : onFilterPressed,
            ),
          ],
        ),
      ),
    );
  }
}
