import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? name;
  DocumentReference? category;
  String? fullPrice;
  String? discontPrice;
  String? imgUrl;
  String? description;
  bool? isFavorite;

  ProductModel(
      {this.id,
      this.name,
      this.category,
      this.description,
      this.discontPrice,
      this.fullPrice,
      this.imgUrl,
      this.isFavorite});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'description': description,
        'discontPrice': discontPrice,
        'fullPrice': fullPrice,
        'imgUrl': imgUrl,
        'isFavorite': isFavorite,
      };

  factory ProductModel.fromJson(QueryDocumentSnapshot<Map> json) {
    return ProductModel(
        id: json.id,
        name: json['name'],
        category: json['category'],
        fullPrice: json['fullPrice'],
        discontPrice: json['discontPrice'],
        description: json['description'],
        imgUrl: json['imgUrl'],
        isFavorite: json['isFavorite']);
  }

  factory ProductModel.fromMap(Map map) {
    return ProductModel(
        name: map['name'],
        category: map['category'],
        fullPrice: map['fullPrice'],
        discontPrice: map['discontPrice'],
        description: map['description'],
        imgUrl: map['imgUrl'],
        isFavorite: map['isFavorite']);
  }
}
