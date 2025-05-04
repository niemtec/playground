enum DemoEntity {
  sonar(
    name: "Sonar",
    description:
        "Sonar animation shows ripples radiating from a central point, creating a sonar effect.",
    rawFilename: "sonar",
  );

  const DemoEntity({required this.name, required this.description, required String rawFilename})
    : _rawFilename = rawFilename;

  final String name;
  final String description;
  final String _rawFilename;

  String get getImageUrl => "assets/images/$_rawFilename.png";

  String get getCodeSampleUrl =>
      "https://github.com/niemtec/playground/blob/main/lib/demo_widgets/$_rawFilename.dart";
}
