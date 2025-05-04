import 'package:flutter/material.dart';

class LandingPageCardWidget extends StatelessWidget {
  const LandingPageCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Card Title'),
          const SizedBox(height: 8.0),
          const Text('Short description of the card.'),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {}, // Navigate to demo page
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: const Text('View Demo'),
          ),
        ],
      ),
    );
  }
}
