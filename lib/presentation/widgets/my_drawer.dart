import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pdf_converter/presentation/widgets/custom_app_bar.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          customAppBar(
            context: context,
            title: "Menyu",
            leading: const SizedBox(),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Ionicons.moon),
              title: Text("Ilova mavzusi"),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Ionicons.information),
              title: Text("Ilova Haqida"),
            ),
          ),
        ],
      ),
    );
  }
}
