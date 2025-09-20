import 'package:flutter/material.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Home"),
          Text("About"),
          Text("Services"),
          Text("Projects"),
          Text("Skills"),
          Text("Contact"),
          Text("Hire Me")
        ],
      ),
    );
  }
}
