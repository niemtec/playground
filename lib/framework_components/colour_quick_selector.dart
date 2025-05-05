import 'package:flutter/material.dart';
import 'package:playground/entities/constants.dart';

class ColourQuickSelector extends StatelessWidget {
  final Function(Color colour) onColourSelected;
  const ColourQuickSelector({required this.onColourSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kBasePadding / 4),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.surfaceContainerHighest, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(kCornerRadius - kBasePadding)),
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 5,
        children: [
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.red),
            onPressed: () => onColourSelected(Colors.red),
          ),
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.deepOrange),
            onPressed: () => onColourSelected(Colors.deepOrange),
          ),
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.amber),
            onPressed: () => onColourSelected(Colors.amber),
          ),
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.yellow),
            onPressed: () => onColourSelected(Colors.yellow),
          ),
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.green),
            onPressed: () => onColourSelected(Colors.green),
          ),
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.teal),
            onPressed: () => onColourSelected(Colors.teal),
          ),
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.cyan),
            onPressed: () => onColourSelected(Colors.cyan),
          ),
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.blue),
            onPressed: () => onColourSelected(Colors.blue),
          ),
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.indigo),
            onPressed: () => onColourSelected(Colors.indigo),
          ),
          IconButton(
            hoverColor: Colors.transparent,
            icon: Icon(Icons.radio_button_checked, color: Colors.deepPurple),
            onPressed: () => onColourSelected(Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
