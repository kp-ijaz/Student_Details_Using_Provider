// // ignore_for_file: unnecessary_null_comparison

// import 'dart:io';

// import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// import 'package:providerApp/model/studentmodel.dart';

// class DetailsPage extends StatelessWidget {
//   final StudentModel student;

//   const DetailsPage({Key? key, required this.student}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             student.image == null
//                 ? const ColoredBox(color: Colors.black)
//                 : CircleAvatar(
//                     radius: 40,
//                     backgroundImage: FileImage(File(student.image)),
//                   ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Name  : ${student.name}',
//                 style:
//                     const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'Place : ${student.place}',
//                 style:
//                     const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Text(
//                 'Age   : ${student.age}',
//                 style:
//                     const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Text(
//                 'Number: ${student.phonenumber}',
//                 style:
//                     const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Implement edit functionality
//                   },
//                   style:
//                       ElevatedButton.styleFrom(backgroundColor: Colors.black),
//                   child: const Icon(Icons.edit),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: const Text('Delete Profile'),
//                           content: const Text(
//                               'Are you sure you want to delete this profile?'),
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('Cancel'),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 // Provider.of<Student>(context, listen: false).removeStudent(student);
//                                 // Navigator.of(context).pop();
//                               },
//                               child: const Text('Delete'),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Icon(Icons.delete),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
