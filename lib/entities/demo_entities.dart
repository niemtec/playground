import 'package:playground/demo_pages/sonar_animation_demo_page.dart';
import 'package:playground/entities/demo_entity.dart';

final List<DemoEntity> demoEntities = [
  DemoEntity(
    name: "Sonar Animation",
    description: "Shows ripples radiating from a central point, creating a sonar effect.",
    rawFilename: "sonar_animation",
    demoBuilder: () => SonarAnimationDemoPage(),
  ),
];
