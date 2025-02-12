import 'package:uuid/uuid.dart';

const uuid = Uuid();

class DreamNote {
  final String id;
  DateTime? bedtime;
  DateTime? wakeUpTime;
  final int rating;
  final String notes;

  DreamNote({
    String? id,
    required this.rating,
    required this.notes,
    this.bedtime,
    this.wakeUpTime,
  }) : id = id ?? uuid.v4();
}
