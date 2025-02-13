import 'package:flutter/material.dart';

class RatingButton extends StatelessWidget {
  final Function(int) rateDream;
  final String rating;

  const RatingButton(
      {super.key, required this.rateDream, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextButton(
        onPressed: () => rateDream(int.parse(rating)),
        style: TextButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        child: Text(
          rating,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
