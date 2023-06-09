import 'package:get/get.dart';

class HomeModel2{
  final String imageUrl;
  final String title;
  final String discount;
  final String subtitle;
  final String description;
  final String location;
  final String price;
  RxBool favorite;
  HomeModel2({
    required this.imageUrl,
    required this.title,
    required this.discount,
    required this.subtitle,
    required this.description,
    required this.location,
    required this.price, 
    required this.favorite
  });
}