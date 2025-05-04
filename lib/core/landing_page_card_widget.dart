import 'package:flutter/material.dart';
import 'package:playground/core/demo_widget_preview_page.dart';
import 'package:playground/entities/constants.dart';
import 'package:playground/entities/demo_entity.dart';

class LandingPageCardWidget extends StatelessWidget {
  final DemoEntity demoEntity;
  const LandingPageCardWidget({required this.demoEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(kCornerRadius + kBasePadding)),
      ),
      child: Padding(
        padding: EdgeInsets.all(kBasePadding),
        child: Column(
          spacing: kBaseSpacing,
          children: [
            Expanded(
              flex: 5,
              child: _imageWidget(
                imageUrl: demoEntity.getImageUrl,
                cornerRadius: kCornerRadius,
                kBasePadding: kBasePadding,
                context: context,
              ),
            ),
            Expanded(
              flex: 2,
              child: _cardTitleAndDescriptionWidget(
                title: demoEntity.name,
                description: demoEntity.description,
                cornerRadius: kCornerRadius,
                kBasePadding: kBasePadding,
                context: context,
              ),
            ),
            Expanded(
              flex: 1,
              child: _buttonWidget(
                onPressed:
                    () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(kCornerRadius)),
                      ),
                      builder:
                          (context) => SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.9, // 90% of screen height
                            child: DemoWidgetPreviewPage(demoEntity: demoEntity),
                          ),
                    ),
                cornerRadius: kCornerRadius,
                kBasePadding: kBasePadding,
                context: context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _imageWidget({
  required String imageUrl,
  required double cornerRadius,
  required double kBasePadding,
  required BuildContext context,
}) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Theme.of(context).colorScheme.outline.withAlpha(25), width: 1.0),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(cornerRadius),
        topRight: Radius.circular(cornerRadius),
        bottomLeft: Radius.circular(cornerRadius / 2),
        bottomRight: Radius.circular(cornerRadius / 2),
      ),
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(cornerRadius),
        topRight: Radius.circular(cornerRadius),
        bottomLeft: Radius.circular(cornerRadius / 2),
        bottomRight: Radius.circular(cornerRadius / 2),
      ),
      child: Image.asset(imageUrl, fit: BoxFit.cover),
    ),
  );
}

Widget _cardTitleAndDescriptionWidget({
  required String title,
  required String description,
  required double cornerRadius,
  required double kBasePadding,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(cornerRadius / 2)),
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
    ),
    width: double.infinity,
    height: double.infinity,
    child: Padding(
      padding: EdgeInsets.all(kBasePadding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines:
                      (constraints.maxHeight ~/ Theme.of(context).textTheme.bodyMedium!.fontSize!)
                          .toInt(),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}

Widget _buttonWidget({
  required Function() onPressed,
  required double cornerRadius,
  required double kBasePadding,
  required BuildContext context,
}) {
  return FilledButton(
    onPressed: onPressed,
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cornerRadius / 2),
          topRight: Radius.circular(cornerRadius / 2),
          bottomLeft: Radius.circular(cornerRadius),
          bottomRight: Radius.circular(cornerRadius),
        ),
      ),
      minimumSize: Size(double.infinity, double.infinity),
    ),
    child: Text("View More"),
  );
}
