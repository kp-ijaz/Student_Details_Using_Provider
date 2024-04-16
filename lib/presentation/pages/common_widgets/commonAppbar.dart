import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:providerApp/presentation/pages/loginpage/login_page.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key, this.title, this.icon}) : super(key: key);

  final String? title;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90.0),
              bottomRight: Radius.circular(90)),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        elevation: 28,
        centerTitle: true,
        title: Text(
          title!,
          style: GoogleFonts.geologica().copyWith(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutConfirmation(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}

void _showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginScrn(),
                ),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
}
