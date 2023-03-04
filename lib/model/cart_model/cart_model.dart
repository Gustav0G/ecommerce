import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  String? id;
  String? name;
  String? fullPrice;
  String? discontPrice;
  String? imgUrl;
  int? qtd;

  CartModel({
    this.id,
    this.name,
    this.discontPrice,
    this.fullPrice,
    this.imgUrl,
    this.qtd,
  });

  factory CartModel.fromJson(QueryDocumentSnapshot<Map> json) {
    return CartModel(
        id: json['id'],
        name: json['name'],
        fullPrice: json['fullPrice'],
        discontPrice: json['discontPrice'],
        imgUrl: json['imgUrl'],
        qtd: json['qtd']);
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'fullPrice': fullPrice,
        'discontPrice': discontPrice,
        'imgUrl': imgUrl,
        'qtd': qtd
      };
}
