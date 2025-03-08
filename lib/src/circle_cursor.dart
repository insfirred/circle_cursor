import 'package:flutter/material.dart';

/// Root Widget of CircleCursor. Use this widget to replace the default mouse cursor with a smooth and customizable circular pointer.
class CircleCursor extends StatefulWidget {
  const CircleCursor({
    super.key,
    required this.child,
    this.innerPointerColor,
    this.innerPointerRadius,
    this.outerPointerColor,
    this.outerPointerRadius,
    this.outerPointerWidth,
    this.outerPointerDelay,
  });

  /// Child Widget
  final Widget child;

  /// Determines the color of the inner pointer.
  final Color? innerPointerColor;

  /// Determines the radius of the inner pointer. Conventionally, the [innerPointerRadius] should be the smaller than [outerPointerRadius].
  final double? innerPointerRadius;

  /// Determines the color of the outer pointer.
  final Color? outerPointerColor;

  /// Determines the radius of the outer pointer. Conventionally, the [outerPointerRadius] should be the greater than [innerPointerRadius].
  final double? outerPointerRadius;

  /// Determines the width of the border of outer pointer.
  final double? outerPointerWidth;

  /// Determines the delay of the outer pointer to reach the mouse position..
  final Duration? outerPointerDelay;

  @override
  State<CircleCursor> createState() => _CircleCursorState();
}

class _CircleCursorState extends State<CircleCursor> {
  Offset pointer = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (eve) {
          setState(() {
            pointer = eve.position;
          });
        },
        child: Stack(
          children: [
            // Child
            widget.child,

            // Outer Pointer
            AnimatedPositioned(
              duration:
                  widget.outerPointerDelay ?? const Duration(milliseconds: 200),
              left: pointer.dx - ((widget.outerPointerRadius ?? 30) / 2),
              top: pointer.dy - ((widget.outerPointerRadius ?? 30) / 2),
              child: IgnorePointer(
                child: Container(
                  height: widget.outerPointerRadius ?? 30,
                  width: widget.outerPointerRadius ?? 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: widget.outerPointerWidth ?? 2,
                      color: widget.outerPointerColor ?? Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),

            // Inner Pointer
            AnimatedPositioned(
              duration: const Duration(milliseconds: 0),
              left: pointer.dx - ((widget.innerPointerRadius ?? 8) / 2),
              top: pointer.dy - ((widget.innerPointerRadius ?? 8) / 2),
              child: IgnorePointer(
                child: Container(
                  height: widget.innerPointerRadius ?? 8,
                  width: widget.innerPointerRadius ?? 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.innerPointerColor ?? Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
