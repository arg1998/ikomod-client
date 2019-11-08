import 'dart:ui';
import 'package:ikomod/models/User.model.dart';
import 'package:ikomod/utils/Types.dart';

class PostModel {
  final UserModel user;
  final int likes;
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final PostType type;
  final ProductTradeType tradeType;
  final int price;
  final Color productColor;
  final String brand;
  final DateTime date;

  PostModel({
    this.id,
    this.description,
    this.likes,
    this.title,
    this.user,
    this.imageUrls,
    this.type,
    this.tradeType,
    this.price,
    this.productColor,
    this.brand,
    this.date,
  });
}
