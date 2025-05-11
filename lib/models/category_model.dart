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
        title: "Rasmni PDF faylga o'tkazish",
        subtitle: "pdf",
        image: "assets/images/image.png"),
  ];
}
