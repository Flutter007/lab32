import 'package:flutter/material.dart';
import 'package:lab32/data/dream_notes_data.dart';
import 'package:lab32/models/dream_note.dart';
import 'package:lab32/screens/dream_diary_screen.dart';
import 'package:lab32/widgets/dream_note_form.dart';
import 'package:lab32/widgets/dream_note_info.dart';

class Lab32 extends StatefulWidget {
  const Lab32({super.key});

  @override
  State<Lab32> createState() => _Lab32State();
}

class _Lab32State extends State<Lab32> {
  List<DreamNote> dreamNotes = [];
  @override
  void initState() {
    super.initState();
    loadDreamNote();
  }

  void loadDreamNote() async {
    final loadedDreamNote = await loadDreamNotes();
    setState(() {
      dreamNotes = loadedDreamNote;
    });
  }

  void addDreamNote(DreamNote newDreamNote) {
    setState(() {
      dreamNotes.add(newDreamNote);
    });
    saveDreamNote(dreamNotes);
  }

  void deleteDreamNote(String id) {
    setState(() {
      dreamNotes.removeWhere((dreamNote) => dreamNote.id == id);
    });
    saveDreamNote(dreamNotes);
  }

  void editDreamNote(DreamNote editDreamNote) {
    setState(() {
      final index = dreamNotes
          .indexWhere((dreamNote) => dreamNote.id == editDreamNote.id);
      dreamNotes[index] = editDreamNote;
    });
    saveDreamNote(dreamNotes);
  }

  void closeInfo() {
    setState(() {
      Navigator.pop(context);
    });
  }

  void openAddDreamNote() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => DreamNoteForm(
        onDreamSaved: addDreamNote,
      ),
    );
  }

  void openEditModalSheet(String id) {
    final toEditNote = dreamNotes.firstWhere((dreamNote) => dreamNote.id == id);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => DreamNoteForm(
        onDreamSaved: editDreamNote,
        editedDreamNote: toEditNote,
      ),
    );
  }

  void openInfoSheet(DreamNote dreamNote) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => DreamNoteInfo(
        dreamNote: dreamNote,
        closeInfo: closeInfo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text(
          'Dream Diary',
          style: theme.textTheme.titleLarge!.copyWith(
              color: Colors.purpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: openAddDreamNote,
            icon: Icon(
              Icons.add,
              size: 32,
              color: theme.colorScheme.error,
            ),
          ),
        ],
        backgroundColor: Colors.grey.shade200,
      ),
      body: DreamDiaryScreen(
        dreamNotes: dreamNotes,
        openInfo: openInfoSheet,
        removeNote: deleteDreamNote,
        editNote: openEditModalSheet,
      ),
    );
  }
}
