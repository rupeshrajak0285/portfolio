import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:particles_network/particles_network.dart';
import 'package:rupesh_flutter_portfolio/top_bar_content/about/about_section.dart';
import 'package:rupesh_flutter_portfolio/top_bar_content/contact/contact_section.dart';
import 'package:rupesh_flutter_portfolio/top_bar_content/projects/project_section.dart';
import 'package:rupesh_flutter_portfolio/top_bar_content/service/service_section.dart';
import 'package:rupesh_flutter_portfolio/top_bar_content/skills/skills_section.dart';
import 'about_me_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Keys to scroll to each section
  final GlobalKey aboutMeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey serviceKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    final particleCount = isMobile ? 150 : 350;
    final maxSpeed = isMobile ? 0.8 : 1.0;
    final maxSize = isMobile ? 1.5 : 2.0;
    final lineDistance = isMobile ? 60.0 : 100.0;
    final lineWidth = isMobile ? 0.3 : 0.5;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (!isMobile)
                Row(
                  children: [
                    _NavItem(title: "Home", onTap: () => scrollToSection(aboutMeKey)),
                    _NavItem(title: "About", onTap: () => scrollToSection(aboutKey)),
                    _NavItem(title: "Services", onTap: () => scrollToSection(serviceKey)),
                    _NavItem(title: "Projects", onTap: () => scrollToSection(projectKey)),
                    _NavItem(title: "Skills", onTap: () => scrollToSection(skillsKey)),
                    _NavItem(title: "Contact", onTap: () => scrollToSection(contactKey)),
                    _NavItem(title: "Hire Me", isButton: true, onTap: () => scrollToSection(contactKey)),
                  ],
                )
              else
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    // TODO: Open Drawer for mobile menu
                  },
                ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Particle background
          ParticleNetwork(
            particleCount: particleCount,
            maxSpeed: maxSpeed,
            maxSize: maxSize,
            lineWidth: lineWidth,
            lineDistance: lineDistance,
            particleColor: Colors.white,
            lineColor: const Color.fromARGB(255, 100, 255, 180),
            touchColor: Colors.amber,
            touchActivation: true,
            drawNetwork: true,
            fill: false,
            isComplex: false,
          ),
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(key: aboutMeKey, child: const AboutMeSection()),
                Container(key: aboutKey, child: const AboutSection()),
                Container(key: serviceKey, child: const ServiceSection()),
                Container(key: projectKey, child: const ProjectSection()),
                Container(key: skillsKey, child: const SkillsSection()),
                Container(key: contactKey, child: const ContactSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isButton;
  final VoidCallback? onTap;

  const _NavItem({required this.title, this.isButton = false, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: isButton
          ? ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      )
          : MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
