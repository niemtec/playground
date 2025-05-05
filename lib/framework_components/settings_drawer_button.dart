import 'package:flutter/material.dart';
import 'package:playground/entities/constants.dart';

class SettingsDrawerButton extends StatelessWidget {
  final String title;
  final IconData darkModeIcon;
  final IconData lightModeIcon;
  final Function() onTap;
  const SettingsDrawerButton({
    required this.title,
    required this.darkModeIcon,
    required this.lightModeIcon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.all(
      Radius.circular(kCornerRadius - kBasePadding),
    );
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(vertical: kBasePadding / 4),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.surfaceContainerHighest, width: 1),
        borderRadius: borderRadius,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        // tileColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: Icon(
          isDarkMode ? lightModeIcon : darkModeIcon,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        title: Text(title),
        onTap: onTap, // Direct call
      ),
    );
  }
}
