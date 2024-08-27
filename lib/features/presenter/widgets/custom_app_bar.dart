import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
      ),
      backgroundColor: const Color(0xFF233C5C),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
