import 'package:flutter/material.dart';

class RatingButton extends StatefulWidget {
  final Function(int) rateDream;
  final String rating;
  const RatingButton({
    super.key,
    required this.rateDream,
    required this.rating,
  });

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  bool isChanged = false;

  void changeIsChanged() {
    setState(() {
      isChanged = !isChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextButton(
        onPressed: () {
          widget.rateDream(int.parse(widget.rating));
          changeIsChanged();
        },
        style: TextButton.styleFrom(
          backgroundColor: isChanged ? Colors.black87 : Colors.purple.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: isChanged
                ? BorderRadius.circular(25)
                : BorderRadius.circular(35),
          ),
        ),
        child: Text(
          widget.rating,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: isChanged ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
