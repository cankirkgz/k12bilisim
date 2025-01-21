import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabs;
  final ValueChanged<int> onTabChanged;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.onTabChanged,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.tabs.asMap().entries.map((entry) {
        int index = entry.key;
        String label = entry.value;

        bool isSelected = index == selectedIndex;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onTabChanged(index);
          },
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }
}
