import 'package:flutter/material.dart';

class UserVoteAverageAnimation extends StatelessWidget {
  const UserVoteAverageAnimation({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TweenAnimationBuilder(
          curve: Curves.fastOutSlowIn,
          tween: Tween<double>(begin: 0, end: voteAverage / 10),
          duration: const Duration(seconds: 2),
          builder: (context, double valueA, child) {
            return CircularProgressIndicator(
                backgroundColor: Colors.black.withOpacity(0.8),
                color: Colors.greenAccent,
                value: valueA);
          },
        ),
        Positioned(
          top: 10,
          left: 8,
          child: TweenAnimationBuilder(
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
              }),
        ),
      ],
    );
  }
}
