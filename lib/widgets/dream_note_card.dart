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
    final titleSmallStyle = theme.textTheme.titleSmall!;
    return GestureDetector(
      onTap: openInfo,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.end,
                    'Отход ко сну:\n ${formatDateTime(dreamNote.bedtime!)}',
                    style: titleSmallStyle,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.end,
                    'Время пробуждения :\n ${formatDateTime(dreamNote.wakeUpTime!)}',
                    style: titleSmallStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
