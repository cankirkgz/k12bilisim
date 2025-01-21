import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.showBackButton = false,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBackButton)
          IconButton(
            icon: Image.asset(
              "assets/icons/left-arrow.png",
            ),
            onPressed: () => Get.back(),
          )
        else if (leading != null)
          leading!,
        const Spacer(),
        if (actions != null) ...actions!,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
