import 'package:flutter/material.dart';
import 'package:slide_switcher/slide_switcher.dart';

class ViewSwitcher extends StatefulWidget {
  final Function(bool isGridView) onViewChanged;

  const ViewSwitcher({super.key, required this.onViewChanged});

  @override
  State<ViewSwitcher> createState() => _ViewSwitcherState();
}

class _ViewSwitcherState extends State<ViewSwitcher> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SlideSwitcher(
      children: [
        Icon(Icons.list_outlined, size: 20),
        Icon(Icons.grid_view, size: 20),
      ],
      onSelect: (index) {
        setState(() {
          selectedIndex = index;
        });
        // Call the callback with true for grid view (index 1), false for list view (index 0)
        widget.onViewChanged(index == 1);
      },
      containerHeight: 40,
      containerWight: 80,
      slidersColors: [Colors.white],
      containerColor: Colors.grey.shade200,
      containerBorderRadius: 12,
    );
  }
}
