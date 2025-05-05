import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:playground/framework_components/settings_drawer.dart';

class WidgetDemoPage extends StatefulWidget {
  final Color themeColor;
  final bool isDarkMode;
  final ValueChanged<Color> onColourSelected;
  final VoidCallback onToggleDarkMode;
  final String title;
  final Widget Function() builder;

  const WidgetDemoPage({
    required this.title,
    required this.builder,
    required this.themeColor,
    required this.isDarkMode,
    required this.onColourSelected,
    required this.onToggleDarkMode,
    super.key,
  });

  @override
  State<WidgetDemoPage> createState() => _WidgetDemoPageState();
}

class _WidgetDemoPageState extends State<WidgetDemoPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openSettingsDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth >= 800;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(widget.title),
            actions:
                isLargeScreen
                    ? null
                    : [IconButton(icon: const Icon(Icons.menu), onPressed: openSettingsDrawer)],
          ),
          body: Center(
            child:
                isLargeScreen
                    ? Row(
                      children: [
                        Expanded(child: widget.builder()),
                        SizedBox(
                          width: 300,
                          child: SettingsDrawer(
                            onColourSelected: widget.onColourSelected,
                            showColourPickerDialog: _showColorPickerDialog, // Remove lambda
                            toggleThemeBrightness: widget.onToggleDarkMode,
                            isDarkMode: widget.isDarkMode,
                            codeUrl: "",
                          ),
                        ),
                      ],
                    )
                    : widget.builder(),
          ),

          endDrawer:
              isLargeScreen
                  ? null
                  : SettingsDrawer(
                    onColourSelected: widget.onColourSelected,
                    showColourPickerDialog: _showColorPickerDialog, // Remove lambda
                    toggleThemeBrightness: widget.onToggleDarkMode,
                    isDarkMode: widget.isDarkMode,
                    codeUrl: "",
                  ),
        );
      },
    );
  }

  void _showColorPickerDialog(BuildContext context) {
    Color tempColor = widget.themeColor;
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Pick theme colour'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: tempColor,
                onColorChanged: (color) => tempColor = color,
                enableAlpha: false,
                hexInputBar: true,
                pickerAreaBorderRadius: BorderRadius.all(Radius.circular(16.0)),
                labelTypes: const [ColorLabelType.rgb],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
              TextButton(
                child: Text('Reset'),
                onPressed: () {
                  widget.onColourSelected(Colors.deepPurple);
                  Navigator.pop(context);
                },
              ),
              OutlinedButton(
                child: Text('Set'),
                onPressed: () {
                  widget.onColourSelected(tempColor);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }
}
