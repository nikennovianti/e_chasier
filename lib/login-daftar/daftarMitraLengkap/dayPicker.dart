import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

import '../loginn.dart';

printIntAsDay(int day) {
  print('Received integer: $day. Corresponds to day: ${intDayToEnglish(day)}');
}

String intDayToEnglish(int day) {
  if (day % 7 == DateTime.monday % 7) return 'Monday';
  if (day % 7 == DateTime.tuesday % 7) return 'Tueday';
  if (day % 7 == DateTime.wednesday % 7) return 'Wednesday';
  if (day % 7 == DateTime.thursday % 7) return 'Thursday';
  if (day % 7 == DateTime.friday % 7) return 'Friday';
  if (day % 7 == DateTime.saturday % 7) return 'Saturday';
  if (day % 7 == DateTime.sunday % 7) return 'Sunday';
  throw '🐞 This should never have happened: $day';
}

class ExampleTitle extends StatelessWidget {
  final String title;

  const ExampleTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: Theme.of(context).textTheme.headline6),
    );
  }
}
String valuesToEnglishDays(List<bool?> values, bool? searchedValue) {
  final days = <String>[];
  for (int i = 0; i < values.length; i++) {
    final v = values[i];
    // Use v == true, as the value could be null, as well (disabled days).
    if (v == searchedValue) days.add(intDayToEnglish(i));
  }
  if (days.isEmpty) return 'NONE';
  return days.join(', ');
}


class SelectedDaysUpdateExample extends StatefulWidget {
  @override
  _SelectedDaysUpdateExampleState createState() =>
      _SelectedDaysUpdateExampleState();
}

class _SelectedDaysUpdateExampleState extends State<SelectedDaysUpdateExample> {
  final values = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // ExampleTitle('Stateful widget with selected days'),
        // Text(
        //     'When the user taps on a day, toggle the state! You can use stateful widgets, or any other methods for managing your state.'),
        // // Using v == true, as some values could be null!
        // Text(
        //     'The days that are currently selected are: ${valuesToEnglishDays(values, true)}.'),
        WeekdaySelector(
          selectedFillColor: secondaryColor,
          onChanged: (v) {
            printIntAsDay(v);
            setState(() {
              values[v % 7] = !values[v % 7];
            });
          },
          values: values,
        ),
      ],
    );
  }
}
