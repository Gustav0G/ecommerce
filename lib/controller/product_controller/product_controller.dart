import 'package:e_commercex/repository/product_repository/product_repository.dart';
import 'package:flutter/material.dart';
import '../../model/product_model/product_model.dart';

class ProductController extends ChangeNotifier {
  ProductRepository repository = ProductRepository();

  Future<List<ProductModel>> readProducts() async {
    var productList = await repository.getProduct();
    List<ProductModel> listProduct = [];
    for (var doc in productList.docs) {
      listProduct.add(ProductModel.fromJson(doc));
    }
    notifyListeners();
    return listProduct;
  }

  Future<List<ProductModel>> readRandomProducts() async {
    List<ProductModel> product = await readProducts();
    var rangeList = product.getRange(0, 7).toList();
    rangeList.shuffle();
    return rangeList;
  }

  Future<List<ProductModel>> readFavoriteProducts() async {
    var productList = await repository.getFavoriteProducts();
    List<ProductModel> listFavorite = [];
    for (var doc in productList.docs) {
      listFavorite.add(ProductModel.fromJson(doc));
    }
    notifyListeners();
    return listFavorite;
  }

  Future<List<ProductModel>> readProductByCategory(
      {required String category}) async {
    var list = await repository.getProductByCategory(category: category);
    List<ProductModel> listProduct = [];
    for (var doc in list.docs) {
      listProduct.add(ProductModel.fromJson(doc));
    }
    notifyListeners();
    return listProduct;
  }

  changeFavoriteProduct(bool favorite, String id) async {
    repository.setFavorite(favorite, id);
  }

  Future<List<ProductModel>> searchProducts(String text) async {
    var listSearch = await repository.searchProduct(text);
    List<ProductModel> listProduct = [];
    for (var doc in listSearch.docs) {
      listProduct.add(ProductModel.fromJson(doc));
    }
    notifyListeners();
    return listProduct;
  }
}
