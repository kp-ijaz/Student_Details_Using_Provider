import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerApp/model/studentmodel.dart';
import 'package:providerApp/provider/stdentprovider.dart';

import '../common_widgets/addstudents.dart';
import '../common_widgets/commonAppbar.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StdbtProvider>(context);
    final List<StudentModel> studentList = studentProvider.studentList;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddStudentDetails(),
            ));
          },
          child: const Icon(Icons.add),
        ),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(
            child: AppBarCustom(
              title: 'GridView',
            ),
          ),
        ),
        body: studentList.isEmpty
            ? const Center(
                child: Text(
                  'No student data available',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (ctx, index) {
                  final StudentModel student = studentList[index];
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: CircleAvatar(
                              radius: 30,
                              backgroundImage: FileImage(File(student.image))),
                        ),
                        Text(student.name),
                        Text(student.place),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                studentProvider.removestudent(index);
                              },
                              icon: const Icon(Icons.delete),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: studentList.length,
              ));
  }
}
