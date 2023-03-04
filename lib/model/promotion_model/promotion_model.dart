import 'package:cloud_firestore/cloud_firestore.dart';

class PromotionModel {
  String description1 = '';
  String description2 = '';
  String imgUrl = '';

  PromotionModel({
    required this.description1,
    required this.description2,
    required this.imgUrl,
  });

  factory PromotionModel.fromJson(QueryDocumentSnapshot<Map> json) {
    return PromotionModel(
      description1: json['description1'],
      description2: json['description2'],
      imgUrl: json['imgUrl'],
    );
  }
}
