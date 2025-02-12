import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lab32/models/dream_note.dart';
import 'package:lab32/widgets/dream_note_card.dart';

class DreamDiaryScreen extends StatelessWidget {
  final List<DreamNote> dreamNotes;
  const DreamDiaryScreen({super.key, required this.dreamNotes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        final dreamNote = dreamNotes[index];
        return Slidable(
          endActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => (),
                label: 'Delete',
                icon: Icons.delete,
              ),
              SlidableAction(
                onPressed: (context) => (),
                label: 'Edit',
                icon: Icons.edit,
              ),
            ],
          ),
          child: DreamNoteCard(openInfo: () {}, dreamNote: dreamNote),
        );
      },
      itemCount: dreamNotes.length,
    );
  }
}
