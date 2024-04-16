import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:providerApp/model/studentmodel.dart';

class StdbtProvider extends ChangeNotifier {
  late Box<StudentModel>? student;

  StdbtProvider() {
    studentProvider();
  }

  studentProvider() async {
    await Hive.initFlutter();
    student = await Hive.openBox<StudentModel>('student');
  }

  List<StudentModel> get studentList {
    return student?.values.toList() ?? [];
  }

  void addstudent(StudentModel value) {
    student?.add(value);
    notifyListeners();
  }

  void removestudent(int index) {
    student?.deleteAt(index);
    notifyListeners();
  }

  void updatestudent(int index, StudentModel updatedval) {
    student?.putAt(index, updatedval);
    notifyListeners();
  }
}
