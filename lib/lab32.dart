import 'package:flutter/material.dart';
import 'package:lab32/models/dream_note.dart';
import 'package:lab32/screens/dream_diary_screen.dart';
import 'package:lab32/widgets/add_dream_note.dart';

class Lab32 extends StatefulWidget {
  const Lab32({super.key});

  @override
  State<Lab32> createState() => _Lab32State();
}

class _Lab32State extends State<Lab32> {
  List<DreamNote> dreamNotes = [
    DreamNote(
      rating: 2,
      notes: '',
      bedtime: DateTime(2025, 03, 03),
      wakeUpTime: DateTime(2024, 03, 03),
    ),
  ];
  void openAddDreamNote() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) => AddDreamNote(),
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
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
      body: DreamDiaryScreen(
        dreamNotes: dreamNotes,
      ),
    );
  }
}
