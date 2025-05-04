import 'package:flutter/material.dart';
import 'package:playground/demo_widgets/sonar_animation.dart';
import 'package:playground/entities/constants.dart';
import 'package:playground/entities/demo_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class DemoWidgetPreviewPage extends StatelessWidget {
  final DemoEntity demoEntity;
  const DemoWidgetPreviewPage({required this.demoEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kBasePadding),
      child: Column(
        spacing: kBaseSpacing,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(demoEntity.name, style: Theme.of(context).textTheme.headlineMedium),
              IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
            ],
          ),
          Row(children: [Text(demoEntity.description)]),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kCornerRadius)),
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  ),
                  child: switch (demoEntity) {
                    DemoEntity.sonar => SonarAnimation(
                      color: Theme.of(context).primaryColor,
                      maxRadius: constraints.maxWidth / 2,
                    ),
                  },
                );
              },
            ),
          ),
          FilledButton(
            onPressed: () {
              debugPrint(demoEntity.getCodeSampleUrl);
              launchUrl(
                Uri.parse(demoEntity.getCodeSampleUrl),
                mode: LaunchMode.externalApplication,
              );
            },
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(kCornerRadius)),
              ),
            ),
            child: Row(children: [Icon(Icons.code), Spacer(), Text("View Code Sample")]),
          ),
        ],
      ),
    );
  }
}
