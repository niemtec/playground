import 'package:flutter/material.dart';
import 'package:playground/entities/constants.dart';

class SettingsDrawerExpandableSection extends StatefulWidget {
  final Widget child;
  final String title;
  final String? subtitle;
  final IconData icon;
  final bool initiallyExpanded;

  const SettingsDrawerExpandableSection({
    super.key,
    required this.child,
    required this.title,
    this.subtitle,
    required this.icon,
    this.initiallyExpanded = false,
  });

  @override
  State<SettingsDrawerExpandableSection> createState() => _SettingsDrawerExpandableSectionState();
}

class _SettingsDrawerExpandableSectionState extends State<SettingsDrawerExpandableSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.all(
      Radius.circular(kCornerRadius - kBasePadding),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: kBasePadding / 4),
      padding: EdgeInsets.all(kBasePadding),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.surfaceContainerHighest, width: 1),
        borderRadius: borderRadius,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: kBasePadding),
            child: GestureDetector(
              onTap: _toggleExpand,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kBasePadding),
                    child: Icon(widget.icon),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: kBasePadding / 2),
                      child: Text(widget.title, style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.5).animate(_animation),
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _animation,
            child: Column(
              children: [
                widget.subtitle != null
                    ? Padding(
                      padding: EdgeInsets.only(
                        left: kBasePadding / 2,
                        right: kBasePadding / 2,
                        bottom: kBasePadding,
                      ),
                      child: Text(widget.subtitle!, style: Theme.of(context).textTheme.bodySmall),
                    )
                    : SizedBox.shrink(),
                widget.child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
