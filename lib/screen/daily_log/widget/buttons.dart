import 'package:daily_log/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final TextStyle titlestyle;
  const Buttons({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.titlestyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.firstcolor, AppColors.secondcolor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(82),
          border: Border.all(color: AppColors.maincolor)),
      child: Center(child: Text(title, style: titlestyle)),
    );
  }
}
