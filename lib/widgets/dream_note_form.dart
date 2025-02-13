import 'package:flutter/material.dart';
import 'package:lab32/helpers/formatted_datetime.dart';
import 'package:lab32/models/dream_note.dart';

import 'package:lab32/widgets/rating_system.dart';

class DreamNoteForm extends StatefulWidget {
  final void Function(DreamNote newDreamNote) onDreamSaved;
  final DreamNote? editedDreamNote;
  const DreamNoteForm({
    super.key,
    required this.onDreamSaved,
    this.editedDreamNote,
  });

  @override
  State<DreamNoteForm> createState() => _AddDreamNoteState();
}

class _AddDreamNoteState extends State<DreamNoteForm> {
  DateTime selectedBedTimeDate = DateTime.now();
  TimeOfDay selectedBedTimeTime = TimeOfDay.now();
  DateTime selectedWakeUpTimeDate = DateTime.now();
  TimeOfDay selectedWakeUpTimeTime = TimeOfDay.now();

  final bedTimeController = TextEditingController();
  final wakeUpTimeController = TextEditingController();
  final bedTimeDateController = TextEditingController();
  final wakeUpTimeDateController = TextEditingController();
  final ratingController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.editedDreamNote != null) {
      final editedNote = widget.editedDreamNote!;
      notesController.text = editedNote.notes;
      ratingController.text = editedNote.rating.toString();
      selectedBedTimeDate = editedNote.bedtime;
      selectedBedTimeTime = TimeOfDay.fromDateTime(selectedBedTimeDate);
      selectedWakeUpTimeDate = editedNote.wakeUpTime;
      selectedWakeUpTimeTime = TimeOfDay.fromDateTime(selectedWakeUpTimeDate);
    }
    bedTimeDateController.text = formatDate(selectedBedTimeDate);
    bedTimeController.text = formatTime(selectedBedTimeTime);
    wakeUpTimeDateController.text = formatDate(selectedWakeUpTimeDate);
    wakeUpTimeController.text = formatTime(selectedWakeUpTimeTime);
  }

  @override
  void dispose() {
    bedTimeDateController.dispose();
    wakeUpTimeDateController.dispose();
    ratingController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void selectRating(int selectedRating) {
    setState(() {
      ratingController.text = selectedRating.toString();
    });
  }

  void onCanceled() {
    setState(() {
      Navigator.of(context).pop();
    });
  }

  void onSave() {
    final bedTime = DateTime(
      selectedBedTimeDate.year,
      selectedBedTimeDate.month,
      selectedBedTimeDate.day,
      selectedBedTimeTime.hour,
      selectedBedTimeTime.minute,
    );
    final wakeTime = DateTime(
      selectedWakeUpTimeDate.year,
      selectedWakeUpTimeDate.month,
      selectedWakeUpTimeDate.day,
      selectedWakeUpTimeTime.hour,
      selectedWakeUpTimeTime.minute,
    );

    final addDreamNote = DreamNote(
        id: widget.editedDreamNote?.id,
        rating: int.parse(ratingController.text),
        notes: notesController.text,
        bedtime: bedTime,
        wakeUpTime: wakeTime);
    widget.onDreamSaved(addDreamNote);
    Navigator.pop(context);
  }

  void onBedTimeDateTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day - 1);
    final lastDate = DateTime(now.year, now.month, now.day);

    final bedTimeDateFromUser = await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: lastDate,
        initialDate: selectedBedTimeDate);

    if (bedTimeDateFromUser != null) {
      setState(() {
        selectedBedTimeDate = bedTimeDateFromUser;
        bedTimeDateController.text = formatDate(selectedBedTimeDate);
      });
    }
  }

  void onBedTimeTimeTap() async {
    final selectedBedTime = await showTimePicker(
      context: context,
      initialTime: selectedBedTimeTime,
    );

    if (selectedBedTime != null) {
      setState(() {
        selectedBedTimeTime = selectedBedTime;
        bedTimeController.text = formatTime(selectedBedTimeTime);
      });
    }
  }

  void onWakeUpTimeDateTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year, now.month, now.day + 1);

    final wakeUpTimeDateFromUser = await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: lastDate,
        initialDate: selectedWakeUpTimeDate);

    if (wakeUpTimeDateFromUser != null) {
      setState(() {
        selectedWakeUpTimeDate = wakeUpTimeDateFromUser;
        wakeUpTimeDateController.text = formatDate(selectedWakeUpTimeDate);
      });
    }
  }

  void onWakeUpTimeTimeTap() async {
    final selectedWakeUpTime = await showTimePicker(
      context: context,
      initialTime: selectedWakeUpTimeTime,
    );

    if (selectedWakeUpTime != null) {
      setState(() {
        selectedWakeUpTimeTime = selectedWakeUpTime;
        wakeUpTimeController.text = formatTime(selectedWakeUpTimeTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final largeStyle = theme.textTheme.titleLarge!;
    final bottomInsetCheck = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottomInsetCheck),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Выберите дату и время отхода :',
              style: largeStyle,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: onBedTimeDateTap,
                    readOnly: true,
                    controller: bedTimeDateController,
                    decoration: InputDecoration(label: Text('Date of BedTime')),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    onTap: onBedTimeTimeTap,
                    readOnly: true,
                    controller: bedTimeController,
                    decoration: InputDecoration(
                      label: Text('Time of BedTime'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Выберите дату и время подъема :',
              style: largeStyle,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: onWakeUpTimeDateTap,
                    readOnly: true,
                    controller: wakeUpTimeDateController,
                    decoration: InputDecoration(
                      label: Text('Date of WakeUp'),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    onTap: onWakeUpTimeTimeTap,
                    readOnly: true,
                    controller: wakeUpTimeController,
                    decoration: InputDecoration(
                      label: Text('Time of WakeUp'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            RatingSystem(selectRating: selectRating),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: notesController,
              decoration: InputDecoration(
                label: Text('Поле для заметок'),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: onCanceled,
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade100),
                    child: Text('Закрыть',
                        style: largeStyle.copyWith(color: Colors.red)),
                  ),
                ),
                SizedBox(width: 50),
                Expanded(
                  child: TextButton(
                    onPressed: onSave,
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.green.shade100),
                    child: Text(
                      'Сохранить',
                      style: largeStyle.copyWith(color: Colors.green),
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
