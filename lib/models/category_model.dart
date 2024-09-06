class CategoryModel {
  final String title;
  final String subtitle;
  final String image;

  CategoryModel(
      {required this.title, required this.subtitle, required this.image});
}

class Categories {
 static List<CategoryModel> categories = [
    CategoryModel(
        title: "Image toPDF",
        subtitle: "Choose images to create PDF",
        image: "assets/images/image.png"),
  ];
}
