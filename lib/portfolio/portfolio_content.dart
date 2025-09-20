import 'package:flutter/material.dart';

import 'about_me_section.dart';

class PortfolioContent extends StatefulWidget {
  const PortfolioContent({super.key});

  @override
  State<PortfolioContent> createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent> {
  @override
  Widget build(BuildContext context) {
    return // Portfolio Content
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [AboutMeSection()],
        ),
      ),
    );
  }
}

