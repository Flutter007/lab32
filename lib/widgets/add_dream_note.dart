import 'package:flutter/material.dart';

import 'package:lab32/widgets/rating_system.dart';

class AddDreamNote extends StatefulWidget {
  const AddDreamNote({super.key});

  @override
  State<AddDreamNote> createState() => _AddDreamNoteState();
}

class _AddDreamNoteState extends State<AddDreamNote> {
  var notes = '';
  int? rating;
  DateTime selectedBedTimeDate = DateTime.now();
  TimeOfDay selectedBedTimeTime = TimeOfDay.now();
  DateTime selectedWakeUpTimeDate = DateTime.now();
  TimeOfDay selectedWakeUpTimeTime = TimeOfDay.now();

  final bedTimeController = TextEditingController();
  final wakeUpTimeController = TextEditingController();
  final bedTimeDateController = TextEditingController();
  final wakeUpTimeDateController = TextEditingController();

  void selectRating(int selectedRating) {
    setState(() {
      rating = selectedRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final largeStyle = theme.textTheme.titleLarge!;
    final bottomInsetCheck = MediaQuery.of(context).viewInsets.bottom;
    return Container(
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
                  onTap: () {},
                  readOnly: true,
                  controller: bedTimeDateController,
                  decoration: InputDecoration(label: Text('Date of BedTime')),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  onTap: () {},
                  readOnly: true,
                  controller: bedTimeDateController,
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
                  onTap: () {},
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
                  onTap: () {},
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
        ],
      ),
    );
  }
}
