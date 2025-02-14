import 'package:flutter/material.dart';
import 'package:lab32/widgets/rating_button.dart';

class RatingSystem extends StatelessWidget {
  final Function(int) selectRating;
  final void Function() changeState;

  const RatingSystem({
    super.key,
    required this.selectRating,
    required this.changeState,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Оцените Ваш Сон:',
              style: Theme.of(context).textTheme.titleLarge!),
          SizedBox(height: 10),
          Row(
            children: [
              RatingButton(
                rateDream: selectRating,
                rating: '1',
              ),
              RatingButton(
                rateDream: selectRating,
                rating: '2',
              ),
              RatingButton(
                rateDream: selectRating,
                rating: '3',
              ),
              RatingButton(
                rateDream: selectRating,
                rating: '4',
              ),
              RatingButton(
                rateDream: selectRating,
                rating: '5',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
