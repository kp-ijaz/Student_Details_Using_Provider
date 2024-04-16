import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerApp/provider/stdentprovider.dart';
import 'package:providerApp/model/studentmodel.dart';
import '../common_widgets/addstudents.dart';
import '../common_widgets/commonAppbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
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
          child: AppBarCustom(
            title: 'ListView',
          ),
        ),
        body: FutureBuilder(
          future: Provider.of<StdbtProvider>(context, listen: false)
              .studentProvider(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error initializing data'));
            } else {
              final studentProvider = Provider.of<StdbtProvider>(context);
              final List<StudentModel> studentList =
                  studentProvider.studentList;

              if (studentList.isEmpty) {
                return const Center(
                  child: Text(
                    'No student data available',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              }

              return ListView.builder(
                itemCount: studentList.length,
                itemBuilder: (context, index) {
                  final StudentModel student = studentList[index];
                  return ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(File(student.image))),
                    title: Text(student.name),
                    subtitle: Text(student.place),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm Delete'),
                                  content: const Text(
                                      'Are you sure you want to delete this student?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        studentProvider.removestudent(index);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
