import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lab32/models/dream_note.dart';
import 'package:lab32/widgets/dream_note_card.dart';

class DreamDiaryScreen extends StatelessWidget {
  final List<DreamNote> dreamNotes;
  final void Function(DreamNote) openInfo;
  final void Function(String id) removeNote;
  final void Function(String id) editNote;
  const DreamDiaryScreen({
    super.key,
    required this.dreamNotes,
    required this.openInfo,
    required this.removeNote,
    required this.editNote,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      itemBuilder: (ctx, index) {
        final dreamNote = dreamNotes[index];
        return Slidable(
          endActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                backgroundColor: theme.colorScheme.error.withAlpha(220),
                onPressed: (context) => removeNote(dreamNote.id),
                label: 'Delete',
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(13),
              ),
              SlidableAction(
                onPressed: (context) => editNote(dreamNote.id),
                backgroundColor: theme.colorScheme.secondary.withAlpha(220),
                label: 'Edit',
                icon: Icons.edit,
                borderRadius: BorderRadius.circular(13),
              ),
            ],
          ),
          child: DreamNoteCard(
            openInfo: () => openInfo(dreamNote),
            dreamNote: dreamNote,
          ),
        );
      },
      itemCount: dreamNotes.length,
    );
  }
}
