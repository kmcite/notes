// final reminderTimesRM = RM.inject(
//   () => ReminderTimes(),
//   // persist: () => persisted(
//   //   'reminderTimes',
//   //   ReminderTimes.fromMap,
//   // ),
// );

import 'package:notes/main.dart';

ReminderTimes reminderTimes([ReminderTimes? reminderTimes]) {
  throw UnimplementedError();
  // if (reminderTimes != null) reminderTimesRM.state = reminderTimes;
  // return reminderTimesRM.state;
}

class ReminderTimes {
  final TimeOfDay morning;
  final TimeOfDay noon;
  final TimeOfDay evening;
  ReminderTimes({
    this.morning = const TimeOfDay(hour: 8, minute: 0),
    this.noon = const TimeOfDay(hour: 13, minute: 0),
    this.evening = const TimeOfDay(hour: 18, minute: 0),
  });
  ReminderTimes copyWith({
    TimeOfDay? morning,
    TimeOfDay? noon,
    TimeOfDay? evening,
  }) {
    return ReminderTimes(
      morning: morning ?? this.morning,
      noon: noon ?? this.noon,
      evening: evening ?? this.evening,
    );
  }
}
