import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            selectedItemColor: const Color.fromARGB(255, 217, 255, 0),
            unselectedItemColor: Colors.black,
            selectedIconTheme: const IconThemeData(
              color: Color.fromARGB(255, 217, 255, 0),
            ),
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt), label: 'ListView'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_rounded), label: 'GridView'),
            ],
          );
        });
  }
}
