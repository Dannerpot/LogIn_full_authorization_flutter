import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final double height;

  SquareTile({
    required this.onTap,
    required this.imagePath,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: height, // Assuming square tiles
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
