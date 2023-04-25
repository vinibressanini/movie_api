import 'package:flutter/material.dart';

class UserVoteAverageAnimation extends StatelessWidget {
  UserVoteAverageAnimation({
    Key? key,
    required this.animate,
    required this.voteAverage,
  }) : super(key: key);

  final double voteAverage;
  bool animate = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        animate
            ? TweenAnimationBuilder(
                curve: Curves.fastOutSlowIn,
                tween: Tween<double>(begin: 0, end: voteAverage / 10),
                duration: const Duration(seconds: 2),
                builder: (context, double valueA, child) {
                  return CircularProgressIndicator(
                      backgroundColor: Colors.black.withOpacity(0.8),
                      color: Colors.greenAccent,
                      value: valueA);
                },
              )
            : CircularProgressIndicator(
                backgroundColor: Colors.black.withOpacity(0.8),
                color: Colors.greenAccent,
                value: voteAverage / 10),
        Positioned(
          top: 10,
          left: 8,
          child: animate
              ? TweenAnimationBuilder(
                  curve: Curves.fastOutSlowIn,
                  tween: Tween<double>(begin: 0, end: voteAverage),
                  duration: const Duration(seconds: 2),
                  builder: (context, double valueA, child) {
                    return Text(
                      '${(valueA * 10).toString().substring(0, 2)}%',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  },
                )
              : Text(
                  '${(voteAverage * 10).toString().substring(0, 2)}%',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
        ),
      ],
    );
  }
}
