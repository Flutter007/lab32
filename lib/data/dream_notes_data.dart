import 'dart:convert';
import 'dart:io';

import 'package:lab32/helpers/get_data_path_file.dart';
import 'package:lab32/models/dream_note.dart';

Future<void> saveDreamNote(List<DreamNote> dreamNotes) async {
  final filePath = await getDataFilePath('dreamNotes');
  final file = File(filePath);
  final dreamNotesMap = dreamNotes
      .map((dreamNote) => {
            'id': dreamNote.id,
            'rating': dreamNote.rating,
            'bedTime': dreamNote.bedTime.toIso8601String(),
            'wakeUpTime': dreamNote.wakeUpTime.toIso8601String(),
            'notes': dreamNote.notes,
          })
      .toList();

  final dreamNotesJson = jsonEncode(dreamNotesMap);
  await file.writeAsString(dreamNotesJson);
}

Future<List<DreamNote>> loadDreamNotes() async {
  try {
    final filePath = await getDataFilePath('dreamNotes');
    final file = File(filePath);
    final jsonContents = await file.readAsString();
    final dreamNotesMaps = jsonDecode(jsonContents) as List<dynamic>;
    return dreamNotesMaps.map((dreamNotesMaps) {
      return DreamNote(
        id: dreamNotesMaps['id'],
        rating: dreamNotesMaps['rating'],
        notes: dreamNotesMaps['notes'],
        bedTime: DateTime.parse(dreamNotesMaps['bedTime']),
        wakeUpTime: DateTime.parse(dreamNotesMaps['wakeUpTime']),
      );
    }).toList();
  } catch (error) {
    return [];
  }
}
