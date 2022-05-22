import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final Widget child;
  final double? padding;
  final double? margin;
  const GlassMorphism({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          margin: EdgeInsets.all(margin ?? 20),
          padding: EdgeInsets.all(padding ?? 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(31, 255, 255, 255).withOpacity(0.2),
                const Color.fromARGB(34, 255, 255, 255).withOpacity(0.2),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.05),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
