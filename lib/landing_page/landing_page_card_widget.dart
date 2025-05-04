import 'package:flutter/material.dart';

class LandingPageCardWidget extends StatelessWidget {
  const LandingPageCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double baseRadius = 16.0;
    final double basePadding = 8.0;
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(baseRadius + basePadding)),
      ),
      child: Padding(
        padding: EdgeInsets.all(basePadding),
        child: Column(
          spacing: basePadding / 2,
          children: [
            Expanded(flex: 5, child: _imageWidget(baseRadius, basePadding, context)),
            Expanded(
              flex: 2,
              child: _cardTitleAndDescriptionWidget(baseRadius, basePadding, context),
            ),
            Expanded(flex: 1, child: _buttonWidget(baseRadius, basePadding, context)),
          ],
        ),
      ),
    );
  }
}

Widget _imageWidget(double cornerRadius, double basePadding, BuildContext context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(cornerRadius),
        topRight: Radius.circular(cornerRadius),
        bottomLeft: Radius.circular(cornerRadius / 2),
        bottomRight: Radius.circular(cornerRadius / 2),
      ),
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
    ),
    child: Padding(
      padding: EdgeInsets.all(basePadding),
      child: const Center(child: Text('Image Placeholder', style: TextStyle(color: Colors.white))),
    ),
  );
}

Widget _cardTitleAndDescriptionWidget(
  double cornerRadius,
  double basePadding,
  BuildContext context,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(cornerRadius / 2)),
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
    ),
    child: Padding(
      padding: EdgeInsets.all(basePadding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card Title',
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'This is a description of the card. It provides more information about the content.',
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

Widget _buttonWidget(double cornerRadius, double basePadding, BuildContext context) {
  return FilledButton(
    onPressed: () {},
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cornerRadius - basePadding),
          topRight: Radius.circular(cornerRadius - basePadding),
          bottomLeft: Radius.circular(cornerRadius),
          bottomRight: Radius.circular(cornerRadius),
        ),
      ),
      minimumSize: Size(double.infinity, double.infinity),
    ),
    child: Text("View More"),
  );
}
