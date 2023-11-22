// // ! same Packages

// // Packages you must install ==>  simple_animations: ^4.0.1 || supercharged: ^2.1.1

// import 'package:flutter/material.dart';
// import 'package:supercharged/supercharged.dart';
// import 'package:simple_animations/simple_animations.dart';

// enum AniProps { opacity, translateY }

// class FadeAnimation extends StatelessWidget {
//   FadeAnimation({super.key, required this.child, required this.delay});

//   final Widget child;
//   final double delay;

//   final tween = MultiTween<AniProps>()
//     ..add(AniProps.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
//     ..add(AniProps.translateY, (-30.0).tweenTo(0.0), 500.milliseconds,
//         Curves.easeOut);

//   @override
//   Widget build(BuildContext context) {
//     return PlayAnimation<MultiTweenValues<AniProps>>(
//         duration: tween.duration,
//         delay: Duration(milliseconds: (500 * delay).round()),
//         builder: (BuildContext context, Widget? child,
//             MultiTweenValues<AniProps> value) {
//           return Opacity(
//             opacity: value.get(AniProps.opacity),
//             child: Transform.translate(
//               offset: Offset(
//                 0.0,
//                 value.get(AniProps.translateY),
//               ),
//               child: child,
//             ),
//           );
//         },
//         tween: tween,
//         child: child);
//   }
// }
