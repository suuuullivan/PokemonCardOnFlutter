import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../filters_view_model.dart';

class FilterBottomSheet extends StatefulWidget {
  final String filterCategory;
  final List<String> selectedFilters;
  final Function(List<String>) onFiltersSelected;

  const FilterBottomSheet({
    super.key,
    required this.filterCategory,
    required this.selectedFilters,
    required this.onFiltersSelected,
  });

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<String> tempSelectedFilters = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tempSelectedFilters = List.from(widget.selectedFilters);

    // Charger les filtres dynamiquement
    Provider.of<FiltersViewModel>(context, listen: false).fetchFilters(widget.filterCategory);
  }

  @override
  Widget build(BuildContext context) {
    final filtersViewModel = Provider.of<FiltersViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Select ${widget.filterCategory}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search ${widget.filterCategory.toLowerCase()}...",
              prefixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  searchController.clear();
                  setState(() {});
                },
              ),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) => setState(() {}),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: filtersViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
              children: filtersViewModel.filters[widget.filterCategory]!
                  .where((filter) =>
                  filter.toLowerCase().contains(searchController.text.toLowerCase()))
                  .map((filter) => CheckboxListTile(
                title: Text(filter),
                value: tempSelectedFilters.contains(filter),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      tempSelectedFilters.add(filter);
                    } else {
                      tempSelectedFilters.remove(filter);
                    }
                  });
                },
              ))
                  .toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onFiltersSelected(tempSelectedFilters);
              Navigator.pop(context);
            },
            child: const Text("Apply Filters"),
          ),
        ],
      ),
    );
  }
}
