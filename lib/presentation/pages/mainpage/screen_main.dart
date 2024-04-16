import 'package:flutter/material.dart';
import 'package:providerApp/presentation/pages/gridview_page/gridview.dart';
import 'package:providerApp/presentation/pages/home_page/home_page.dart';

import 'bottomnav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [
    const Homepage(),
    const GridViewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (cotext, int index, _) {
            return pages[index];
          }),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
