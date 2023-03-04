import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? name;
  String? urlImage;

  CategoryModel({this.name, this.urlImage});

  factory CategoryModel.fromJson(QueryDocumentSnapshot<Map> json) {
    return CategoryModel(name: json['name'], urlImage: json['urlImage']);
  }
}
