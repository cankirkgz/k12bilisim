import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchBox({
    super.key,
    this.hintText = "Search",
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(
              "assets/icons/search.png",
              fit: BoxFit.contain,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18.0),
          border: InputBorder.none,
          suffixIcon: controller != null && controller!.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    controller!.clear();
                    onChanged?.call('');
                  },
                )
              : null,
        ),
      ),
    );
  }
}
