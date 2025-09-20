import 'package:flutter/material.dart';

class ProfileCirclePage extends StatefulWidget {
  final double size;
  const ProfileCirclePage({super.key, required this.size});

  @override
  State<ProfileCirclePage> createState() => _ProfileCirclePageState();
}

class _ProfileCirclePageState extends State<ProfileCirclePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    _borderColorAnimation = ColorTween(
      begin: const Color(0xFFFF7A50),
      end: Colors.pinkAccent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _borderColorAnimation,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _borderColorAnimation.value ?? const Color(0xFFFF7A50),
              width: 4,
            ),
            image: const DecorationImage(
              image: AssetImage("assets/profile.jpeg"),
              fit: BoxFit.cover, // ensures the image fills the circle proportionally
            ),
          ),
        );
      },
    );
  }
}
