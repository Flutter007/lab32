import 'package:flutter/material.dart';
import 'package:lab32/helpers/formatted_datetime.dart';
import 'package:lab32/models/dream_note.dart';

class DreamNoteCard extends StatelessWidget {
  final void Function() openInfo;

  final DreamNote dreamNote;
  const DreamNoteCard({
    super.key,
    required this.openInfo,
    required this.dreamNote,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final difference =
        dreamNote.wakeUpTime.difference(dreamNote.bedTime).inMinutes;

    final titleSmallStyle = theme.textTheme.titleSmall!;
    return GestureDetector(
      onTap: openInfo,
      child: Card(
        color: Colors.purple.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Отход ко сну:\n ${formatDateTime(dreamNote.bedTime)}',
                    style: titleSmallStyle,
                  ),
                  Text(
                    'Рейтинг сна : ${dreamNote.rating}',
                    style: titleSmallStyle,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Время пробуждения :\n ${formatDateTime(dreamNote.wakeUpTime)}',
                    style: titleSmallStyle,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Продолжительность сна: ${difference.toString()} min',
                    style: titleSmallStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
