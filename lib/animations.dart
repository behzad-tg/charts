import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// right to left
enum RightToleftAnimationType { opacity, translateX }

class RightToleftAnimation extends StatefulWidget {
  final double delay;
  final Widget child;
  // ignore: use_key_in_widget_constructors
  const RightToleftAnimation( this.delay, this.child);

  @override
  _RightToleftAnimationState createState() => _RightToleftAnimationState();
}

class _RightToleftAnimationState extends State<RightToleftAnimation> {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<RightToleftAnimationType>()
      ..add(
        RightToleftAnimationType.opacity,
        Tween(begin: 0.0, end: 1.0),
        const Duration(milliseconds: 200),
      )
      ..add(
        RightToleftAnimationType.translateX,
        Tween(begin: 500.0, end: 0.0),
        const Duration(milliseconds: 200),
      );

    return PlayAnimation<MultiTweenValues<RightToleftAnimationType>>(
      delay: Duration(milliseconds: (500 * widget.delay).round()),
      duration: tween.duration,
      tween: tween,
      child: widget.child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(RightToleftAnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(RightToleftAnimationType.translateX), 0),
            child: child),
      ),
    );
  }
}

// left to right
enum LeftToRightAnimationType { opacity, translateX }

class LeftToRightAnimation extends StatefulWidget {
  final double delay;
  final Widget child;
  // ignore: use_key_in_widget_constructors
  const LeftToRightAnimation(this.delay, this.child);

  @override
  _LeftToRightAnimationState createState() => _LeftToRightAnimationState();
}

class _LeftToRightAnimationState extends State<LeftToRightAnimation> {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<LeftToRightAnimationType>()
      ..add(
        LeftToRightAnimationType.opacity,
        Tween(begin: 0.0, end: 1.0),
        const Duration(milliseconds: 200),
      )
      ..add(
        LeftToRightAnimationType.translateX,
        Tween(begin: -100.0, end: 0.0),
        const Duration(milliseconds: 200),
      );

    return PlayAnimation<MultiTweenValues<LeftToRightAnimationType>>(
      delay: Duration(milliseconds: (1000 * widget.delay).round()),
      duration: tween.duration,
      tween: tween,
      child: widget.child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(LeftToRightAnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(LeftToRightAnimationType.translateX), 0),
            child: child),
      ),
    );
  }
}
