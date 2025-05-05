import 'package:flutter/material.dart';
import 'package:playground/framework_components/landing_page.dart';

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
      home: Scaffold(
        appBar: AppBar(title: const Text('Playground')),
        body: SafeArea(
          child: LandingPage(
            themeColor: _themeColor,
            isDarkMode: _isDarkMode,
            onColourSelected: (newColour) => setState(() => _themeColor = newColour),
            onToggleDarkMode: () => setState(() => _isDarkMode = !_isDarkMode),
          ),
        ),
      ),
    );
  }
}
