import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pdf_converter/presentation/pages/home_sceen.dart';

import '../../constants/colors_constants.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: pageIndex,
        children: const [
          HomeSceen(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(18),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: mainColor.withOpacity(0.03),
              blurRadius: 20,
              spreadRadius: 0.005,
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: FlashyTabBar(
          selectedIndex: pageIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            pageIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(
                Ionicons.home,
                color: unSelectedItemColor,
              ),
              activeColor: mainColor,
              title: const Text('Asosiy'),
            ),
           
            FlashyTabBarItem(
              icon: Icon(
                Ionicons.settings,
                color: unSelectedItemColor,
              ),
              activeColor: mainColor,
              title: const Text('Sozlamalar'),
            ),
          ],
        ),
      ),
    );
  }
}
