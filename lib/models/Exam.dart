import 'package:flutter/material.dart';


class Exam {
final String subjectName;
final DateTime dateTime;
final List<String> rooms;


const Exam({
required this.subjectName,
required this.dateTime,
required this.rooms,
});


bool get isPast => dateTime.isBefore(DateTime.now());
}