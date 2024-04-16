import 'package:hive_flutter/hive_flutter.dart';

part 'studentmodel.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String age;

  @HiveField(3)
  late String place;

  @HiveField(4)
  late String phonenumber;

  @HiveField(5)
  late String image;

  StudentModel({
    this.id,
    required this.name,
    required this.age,
    required this.place,
    required this.phonenumber,
    required this.image,
  });
}
