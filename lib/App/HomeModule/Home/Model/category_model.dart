import 'package:redseaboats/App/HomeModule/HomeDailog/Model/home_model.dart';

class CategoriesModel{
  final String imageUrl;
  final String title;
  final List<HomeModel> categories;
  CategoriesModel({
    required this.imageUrl,
    required this.title,
    required this.categories
  });
}
