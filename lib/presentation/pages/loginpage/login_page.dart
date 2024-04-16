import 'package:flutter/material.dart';
import 'package:providerApp/presentation/pages/mainpage/screen_main.dart';

class LoginScrn extends StatelessWidget {
  LoginScrn({super.key});

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 134, 157, 175)),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, top: 20),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: ('Username')),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is Invalid';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ('Password')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is Invalid';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  // const Column(
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(top: 10, right: 5),
                  //       child: Text(
                  //         'Username and password doesnot match',
                  //         style: TextStyle(
                  //           color: Color.fromARGB(255, 123, 226, 27),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenMainPage()));
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('Login')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
