import 'package:uuid/uuid.dart';

const uuid = Uuid();

class DreamNote {
  final String id;
  DateTime bedtime;
  DateTime wakeUpTime;
  int rating;
  final String notes;

  DreamNote({
    String? id,
    required this.rating,
    required this.notes,
    required this.bedtime,
    required this.wakeUpTime,
  }) : id = id ?? uuid.v4();
}
