import 'package:flutter/material.dart';
import 'package:playground/entities/demo_entities.dart';
import 'package:playground/framework_components/landing_page_card_widget.dart';

class LandingPage extends StatefulWidget {
  final Color themeColor;
  final bool isDarkMode;
  final ValueChanged<Color> onColourSelected;
  final VoidCallback onToggleDarkMode;
  const LandingPage({
    required this.themeColor,
    required this.isDarkMode,
    required this.onColourSelected,
    required this.onToggleDarkMode,
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isSmallScreen ? 1 : 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: demoEntities.length,
        itemBuilder: (context, index) {
          final demo = demoEntities[index];
          return LandingPageCardWidget(
            demoEntity: demo,
            themeColor: widget.themeColor,
            isDarkMode: widget.isDarkMode,
            onColourSelected: widget.onColourSelected,
            onToggleDarkMode: widget.onToggleDarkMode,
          );
        },
      ),
    );
  }
}
