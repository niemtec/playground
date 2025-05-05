import 'package:flutter/material.dart';
import 'package:playground/entities/constants.dart';
import 'package:playground/framework_components/colour_quick_selector.dart';
import 'package:playground/framework_components/settings_drawer_button.dart';
import 'package:playground/framework_components/settings_drawer_expandable_section.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDrawer extends StatelessWidget {
  final String codeUrl;
  final Function(BuildContext) showColourPickerDialog;
  final Function() toggleThemeBrightness;
  final bool isDarkMode;
  final Function(Color colour) onColourSelected;
  const SettingsDrawer({
    required this.codeUrl,
    required this.showColourPickerDialog,
    required this.toggleThemeBrightness,
    required this.isDarkMode,
    required this.onColourSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kBasePadding),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kCornerRadius)),
        ),
        child: Padding(
          padding: EdgeInsets.all(kBasePadding),
          child: ListView(
            children: [
              Container(
                // height: 150,
                padding: EdgeInsets.all(kBasePadding),
                margin: EdgeInsets.only(bottom: kBasePadding),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.all(Radius.circular(kCornerRadius - kBasePadding)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Properties', style: Theme.of(context).textTheme.headlineMedium),
                    Text(
                      'Use the options below to change the properties of the widget.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              SettingsDrawerButton(
                title: "View code sample",
                darkModeIcon: Icons.bug_report_outlined,
                lightModeIcon: Icons.bug_report_outlined,
                onTap: () => launchUrl(Uri.parse(codeUrl), mode: LaunchMode.externalApplication),
              ),
              SettingsDrawerButton(
                title: "Toggle brightness",
                darkModeIcon: Icons.dark_mode,
                lightModeIcon: Icons.light_mode,
                onTap: toggleThemeBrightness,
              ),
              SettingsDrawerExpandableSection(
                title: 'Theme',
                subtitle:
                    'Change the appearance of the app by choosing a theme colour from the options below, or use the button to pick your own colour.',
                icon: Icons.color_lens,
                child: Column(
                  children: [
                    ColourQuickSelector(onColourSelected: onColourSelected),
                    SettingsDrawerButton(
                      title: "Pick a colour",
                      darkModeIcon: Icons.color_lens,
                      lightModeIcon: Icons.color_lens,
                      onTap: () => showColourPickerDialog(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
