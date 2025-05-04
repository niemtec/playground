import 'package:flutter/material.dart';

class SliderCardWidget extends StatelessWidget {
  const SliderCardWidget({super.key});

  final double baseRadius = 32.0;
  final double basePadding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: Theme.of(context).colorScheme.primaryContainer),
        borderRadius: BorderRadius.all(Radius.circular(baseRadius)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withAlpha(32),
            blurRadius: 16.0,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(basePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.play_arrow, color: Theme.of(context).colorScheme.onPrimary),
              label: Text(
                "Start",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(baseRadius - basePadding),
                    bottomRight: Radius.circular(baseRadius - basePadding),
                  ),
                ),
                minimumSize: Size(double.infinity, 64), // Adjust width and height
              ),
            ),
          ],
        ),
      ),
    );
  }
}
