import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:playground/landing_page/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _themeColor = Colors.deepPurple;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _themeColor,
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'Playground',
      theme: theme,
      home: HomeScreen(
        themeColor: _themeColor,
        isDarkMode: _isDarkMode,
        onColorSelected: (newColor) {
          setState(() {
            _themeColor = newColor;
          });
        },
        onToggleDarkMode: () {
          setState(() {
            _isDarkMode = !_isDarkMode;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color themeColor;
  final bool isDarkMode;
  final ValueChanged<Color> onColorSelected;
  final VoidCallback onToggleDarkMode;

  const HomeScreen({
    super.key,
    required this.themeColor,
    required this.isDarkMode,
    required this.onColorSelected,
    required this.onToggleDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Playground')),
      body: Center(child: LandingPage()),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'toggle_theme',
            onPressed: onToggleDarkMode,
            child: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'pick_color',
            child: Icon(Icons.color_lens, color: Theme.of(context).colorScheme.onPrimaryContainer),
            onPressed: () => _showColorPickerDialog(context),
          ),
        ],
      ),
    );
  }

  void _showColorPickerDialog(BuildContext context) {
    Color tempColor = themeColor;
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
              TextButton(onPressed: Navigator.of(context).pop, child: Text('Cancel')),
              TextButton(
                child: Text('Reset'),
                onPressed: () {
                  onColorSelected(Colors.deepPurple);
                  Navigator.of(context).pop();
                },
              ),
              OutlinedButton(
                child: Text('Set'),
                onPressed: () {
                  onColorSelected(tempColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  }
}
