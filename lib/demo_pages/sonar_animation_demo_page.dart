import 'package:flutter/material.dart';
import 'package:playground/demo_widgets/sonar_animation.dart';

class SonarAnimationDemoPage extends StatelessWidget {
  const SonarAnimationDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SonarAnimation(
        color: Theme.of(context).colorScheme.primary,
        maxRadius: 200,
        minRadius: 30,
        ripplesCount: 4,
      ),
    );
  }
}
