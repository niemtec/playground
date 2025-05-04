import 'package:flutter/material.dart';

class SonarAnimation extends StatefulWidget {
  const SonarAnimation({
    required this.child,
    this.color = Colors.black,
    this.delay = Duration.zero,
    this.minRadius = 0,
    this.maxRadius = 500,
    this.ripplesCount = 3,
    this.duration = const Duration(milliseconds: 2300),
    super.key,
  });

  ///[Widget] this widget will placed at center of the animation
  final Widget child;

  ///[Duration] delay of the animation
  final Duration delay;

  /// [double] minimum radius of the animation
  final double minRadius;

  /// [double] maximum radius of the animation
  final double maxRadius; // Added maxRadius field

  /// [Color] color of the animation
  final Color color;

  /// [int] number of circle that u want to display in the animation
  final int ripplesCount;

  /// [Duration]  of the animation
  final Duration duration;

  @override
  SonarAnimationState createState() => SonarAnimationState();
}

///state of the animation
class SonarAnimationState extends State<SonarAnimation>
    with TickerProviderStateMixin<SonarAnimation> {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this)..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: CirclePainter(
      _controller,
      color: widget.color,
      minRadius: widget.minRadius,
      maxRadius: widget.maxRadius,
      wavesCount: widget.ripplesCount,
    ),
    child: widget.child,
  );
}

/// Creating a Circular painter for clipping the rect and creating circle shape
class CirclePainter extends CustomPainter {
  ///initialize the painter
  CirclePainter(
    this.animation, {
    required this.wavesCount,
    required this.color,
    this.minRadius,
    this.maxRadius,
  }) : super(repaint: animation);

  ///[Color] of the painter
  final Color color;

  ///[double] minimum radius of the painter
  final double? minRadius;

  ///[double] maximum radius of the painter
  final double? maxRadius;

  ///[int] number of wave count in the animation
  final int wavesCount;

  ///[Color] of the painter
  final Animation<double>? animation;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = Paint(); // Reuse a single Paint object

    for (int wave = 0; wave < wavesCount; wave++) {
      final double waveProgress = ((wave + animation!.value) / wavesCount) % 1.0;
      final double opacity = (1 - waveProgress).clamp(0.0, 1.0);

      if (opacity > 0) {
        // Skip fully transparent waves
        paint.color = color.withOpacity(opacity);

        final double radius = minRadius! + ((maxRadius! - minRadius!) * waveProgress);
        canvas.drawCircle(rect.center, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.minRadius != minRadius ||
        oldDelegate.maxRadius != maxRadius ||
        oldDelegate.wavesCount != wavesCount ||
        oldDelegate.animation != animation;
  }
}
