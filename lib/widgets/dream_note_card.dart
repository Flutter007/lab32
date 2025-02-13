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
    final difference = DateTime(dreamNote.wakeUpTime.day,
            dreamNote.wakeUpTime.hour, dreamNote.wakeUpTime.minute)
        .difference(DateTime(dreamNote.bedtime.day, dreamNote.bedtime.hour,
            dreamNote.bedtime.minute))
        .inMinutes;

    final titleSmallStyle = theme.textTheme.titleSmall!;
    return GestureDetector(
      onTap: openInfo,
      child: Card(
        color: Colors.purple.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.end,
                    'Отход ко сну: ${formatDateTime(dreamNote.bedtime)}',
                    style: titleSmallStyle,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Время пробуждения : ${formatDateTime(dreamNote.wakeUpTime)}',
                    style: titleSmallStyle,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Рейтинг сна : ${dreamNote.rating}',
                style: titleSmallStyle,
              ),
              Text(difference.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
