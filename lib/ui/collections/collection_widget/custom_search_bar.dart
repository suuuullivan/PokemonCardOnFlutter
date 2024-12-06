import 'package:flutter/material.dart';
import '../../../themes/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onClear;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.hintText = 'Search',
    required this.onClear,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            icon: const Icon(Icons.search, color: AppColor.darkCyan),
            onPressed: () {  },
          ),
        ],
      ),
    );
  }
}