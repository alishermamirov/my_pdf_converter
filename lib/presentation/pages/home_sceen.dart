import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pdf_converter/models/category_model.dart';
import 'package:pdf_converter/presentation/pages/image_to_pdf_screen.dart';
import 'package:pdf_converter/presentation/widgets/custom_app_bar.dart';
import 'package:pdf_converter/presentation/widgets/my_drawer.dart';

class HomeSceen extends StatelessWidget {
  HomeSceen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const MyDrawer(),
      appBar: customAppBar(
        context: context,
        title: "PDF Converter",
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: const Icon(
            Ionicons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: Categories.categories.length,
        itemBuilder: (context, index) {
          final category = Categories.categories[index];
          return ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ImageToPdfScreen(),
              ),
            ),
            contentPadding: const EdgeInsets.all(8),
            leading: Image.asset(
              category.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(
              category.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              category.subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          );
        },
      ),
    );
  }
}
