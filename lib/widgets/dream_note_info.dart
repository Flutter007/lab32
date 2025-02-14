import 'package:flutter/material.dart';
import 'package:lab32/helpers/formatted_datetime.dart';
import 'package:lab32/models/dream_note.dart';
import 'package:lab32/widgets/dream_note_info_text.dart';

class DreamNoteInfo extends StatelessWidget {
  final DreamNote dreamNote;
  final void Function() closeInfo;
  const DreamNoteInfo({
    super.key,
    required this.dreamNote,
    required this.closeInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleMediumTheme = theme.textTheme.titleMedium!;
    final bedTimeDate = formatDateTime(dreamNote.bedTime);
    final wakeUpDate = formatDateTime(dreamNote.wakeUpTime);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DreamNoteInfoText(
              txt: 'BedTime',
              meaning: bedTimeDate,
            ),
            DreamNoteInfoText(
              txt: 'WakeUpTime',
              meaning: wakeUpDate,
            ),
            DreamNoteInfoText(
              txt: 'Rating',
              meaning: dreamNote.rating.toString(),
            ),
            DreamNoteInfoText(
              txt: 'Note Field',
              meaning: (dreamNote.notes != '') ? dreamNote.notes : 'None',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: closeInfo,
                  child: Text(
                    'Закрыть',
                    style: titleMediumTheme.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
