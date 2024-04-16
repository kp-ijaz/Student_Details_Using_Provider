import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:providerApp/model/studentmodel.dart';
import 'package:providerApp/provider/imageprovider.dart';
import 'package:providerApp/provider/stdentprovider.dart';

import 'commontextform.dart';

class AddStudentDetails extends StatelessWidget {
  AddStudentDetails({super.key});

  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final placecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        elevation: 0,
        title: const Text(
          'Add Student',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CommonTextForm(
                    title: 'Enter the name of the student',
                    controllertype: namecontroller,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Add image of the student:',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Consumer<ImageProviderModel>(
                            builder: (context, value, child) {
                              return value.image != null
                                  ? Image.file(
                                      value.image!,
                                      fit: BoxFit.cover,
                                    )
                                  : const Center(
                                      child: Text(
                                        'No image selected',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                            },
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey),
                        ),
                        onPressed: () {
                          _pickImageFromGallery(context);
                        },
                        child: const Text('Add Image of the Student'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CommonTextForm(
                    title: 'Age of the student',
                    typekeyboard: true,
                    controllertype: agecontroller,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Age is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CommonTextForm(
                    title: 'Enter the place',
                    typekeyboard: false,
                    controllertype: placecontroller,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Place is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CommonTextForm(
                    title: 'Phone number',
                    typekeyboard: true,
                    controllertype: phonecontroller,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone is required';
                      } else if (value.length != 10) {
                        return 'Phone number must be 10 digits';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.grey),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        addStudent(context);
                      }
                    },
                    child: const Text('ADD STUDENT'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Provider.of<ImageProviderModel>(context, listen: false)
          .setImage(File(pickedFile.path));
    }
  }

  Future<void> addStudent(BuildContext context) async {
    final data = Provider.of<StdbtProvider>(context, listen: false);
    final imagedata = Provider.of<ImageProviderModel>(context, listen: false);
    // final studentBox = await Hive.openBox<StudentModel>('student_box');
    final newStudent = StudentModel(
      name: namecontroller.text,
      age: agecontroller.text,
      place: placecontroller.text,
      phonenumber: phonecontroller.text,
      image: imagedata.image!.path ?? '',
    );
    data.addstudent(newStudent);

    namecontroller.clear();
    agecontroller.clear();
    placecontroller.clear();
    namecontroller.clear();
    phonecontroller.clear();
    imagedata.setImage(null);
    Navigator.of(context).pop();
  }
}
