// Info card widget
import 'package:flutter/material.dart';

import '../constant/app_text_style.dart';

class InfoCard extends StatelessWidget {
  final String number;
  final String label;

  const InfoCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white12, // background color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number,
            style: AppTextStyles.h3().copyWith(
              color: const Color(0xFFFF7A50), // number color
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: AppTextStyles.body(), // label text style
          ),
        ],
      ),
    );
  }
}