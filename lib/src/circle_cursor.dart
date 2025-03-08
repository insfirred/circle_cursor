import 'package:flutter/material.dart';

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

  final Widget child;
  final Color? innerPointerColor;
  final double? innerPointerRadius;
  final Color? outerPointerColor;
  final double? outerPointerRadius;
  final double? outerPointerWidth;
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
