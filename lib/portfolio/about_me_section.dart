import 'package:flutter/material.dart';
import 'package:rupesh_flutter_portfolio/portfolio/profile_image.dart';
import 'package:rupesh_flutter_portfolio/portfolio/social_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../constant/app_text_style.dart';
import 'infor_card.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 50,
            vertical: 30,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  // Top section: Intro + Avatar
                  isMobile
                      ? Column(
                          children: [
                            const ProfileCirclePage(size: 200),
                            const SizedBox(height: 30),
                            _IntroText(isMobile: true),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 6,
                              child: _IntroText(isMobile: false),
                            ),
                            const SizedBox(width: 40),
                            Center(child: ProfileCirclePage(size: 250)),
                          ],
                        ),
                  const SizedBox(height: 50),
                  // Info cards
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: isMobile
                        ? WrapAlignment.center
                        : WrapAlignment.start,
                    children: const [
                      InfoCard(number: "3+", label: "Years Experience"),
                      InfoCard(number: "10+", label: "Projects Completed"),
                      InfoCard(number: "5+", label: "Happy Clients"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _IntroText extends StatelessWidget {
  final bool isMobile;

  const _IntroText({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text("Hi, I'm", style: AppTextStyles.body()),
        const SizedBox(height: 5),
        Text("Rupesh Rajak", style: AppTextStyles.h2()),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            style: AppTextStyles.h3(),
            children: [
              TextSpan(
                text: "Flutter ",
                style: AppTextStyles.subHeading(color: const Color(0xFFFF7A50)),
              ),
              TextSpan(
                text: "Developer",
                style: AppTextStyles.subHeading(color: const Color(0xFF64C8FF)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Turning ideas into interactive, user-friendly apps with clean, maintainable Flutter code. Passionate about crafting seamless mobile experiences.",
          style: AppTextStyles.body(),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        Text(
          "Building beautiful, performant, and scalable mobile applications with Flutter. I love transforming concepts into intuitive digital experiences.",
          style: AppTextStyles.body(),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        Text(
          "Creating mobile apps that are not just functional but delightful. Skilled in Flutter, I focus on design, usability, and robust architecture.",
          style: AppTextStyles.body(),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        Text(
          "I specialize in Flutter development, delivering apps that combine elegant design with seamless functionality. Bringing ideas to life, one line of code at a time.",
          style: AppTextStyles.body(),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        Text(
          "Passionate Flutter developer committed to crafting intuitive, high-quality mobile applications that enhance user experiences and drive innovation.",
          style: AppTextStyles.body(),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),

        const SizedBox(height: 20),
        // Social buttons
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: const [
            SocialButton(icon: Icons.code, url: "https://github.com/"),
            SizedBox(width: 10),
            SocialButton(
              icon: Icons.linked_camera,
              url: "https://linkedin.com/",
            ),
            SizedBox(width: 10),
            SocialButton(icon: Icons.message, url: "https://twitter.com/"),
            SizedBox(width: 10),
            SocialButton(icon: Icons.photo, url: "https://instagram.com/"),
          ],
        ),
        const SizedBox(height: 20),

        // Action buttons
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                const email = 'Rupeshrajak438@gmail.com';
                const subject = 'Contact from Portfolio';
                final mailtoLink = 'mailto:$email?subject=$subject';

                if (await canLaunchUrlString(mailtoLink)) {
                  await launchUrlString(mailtoLink);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open email app')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7A50),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
              ),
              child: Text("Get In Touch", style: AppTextStyles.button()),
            ),

            const SizedBox(width: 15),

            OutlinedButton(
              onPressed: () async {
                const url =
                    'https://drive.google.com/file/d/1FIv4X-cWes81Qlq8opVFo3noZXahRSjf/view';
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open CV')),
                  );
                }
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
              ),
              child: Text("Download CV", style: AppTextStyles.button()),
            ),
          ],
        ),
      ],
    );
  }
}
