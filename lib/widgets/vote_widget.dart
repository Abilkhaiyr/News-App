import 'package:flutter/material.dart';

class VoteWidget extends StatefulWidget {
  final double? voteAverage;
  const VoteWidget({super.key, this.voteAverage});

  @override
  State<VoteWidget> createState() => _VoteWidgetState();
}

class _VoteWidgetState extends State<VoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.white),
      child: Center(
        child: Text(
          widget.voteAverage.toString().substring(0, 3),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
