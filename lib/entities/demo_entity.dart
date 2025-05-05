import 'package:flutter/material.dart';

class DemoEntity {
  final String name;
  final String description;
  final String rawFilename;
  final Widget Function() demoBuilder;

  const DemoEntity({
    required this.name,
    required this.description,
    required this.rawFilename,
    required this.demoBuilder,
  });

  String get imageUrl => "assets/images/$rawFilename.png";

  String get codeSampleUrl =>
      "https://github.com/niemtec/playground/blob/main/lib/demo_widgets/$rawFilename.dart";
}
