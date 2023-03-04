import 'package:e_commercex/model/cart_model/cart_model.dart';
import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:e_commercex/repository/cart_repository/cart_repository.dart';
import 'package:flutter/cupertino.dart';

class CartController extends ChangeNotifier {
  CartRepository repository = CartRepository();
  addItemToCart(ProductModel product, String id) {
    CartModel cart = CartModel(
        id: product.id ?? id,
        name: product.name,
        fullPrice: product.fullPrice,
        discontPrice: product.discontPrice,
        imgUrl: product.imgUrl,
        qtd: 1);
    Map<String, dynamic> cartProduct = cart.toMap();
    repository.addToCart(cartProduct);
  }

  Future<List<CartModel>> readCartData() async {
    var cartDataList = await repository.getCartProducts();
    List<CartModel> cartListItens = [];
    for (var doc in cartDataList.docs) {
      cartListItens.add(CartModel.fromJson(doc));
    }
    //print(' ${listProduct[0].category}');
    notifyListeners();
    return cartListItens;
  }

  increaseProductQtd(String id, int qtd) async {
    repository.increaseProductQtd(id, qtd);
  }

  deacreaseProductQtd(String id, int qtd) async {
    repository.decreaseProductQtd(id, qtd);
  }

  deleteProduct(String id) async {
    repository.deleteProduct(id);
  }

  String sumDiscontPrice(List<CartModel> cartList) {
    double count = 0;

    for (int i = 0; i < cartList.length; i++) {
      count =
          count + double.parse(cartList[i].discontPrice!) * cartList[i].qtd!;
    }
    return count.toString();
  }

  String sumTotalPrice(List<CartModel> cartList) {
    double count = 0;

    for (int i = 0; i < cartList.length; i++) {
      count = count + double.parse(cartList[i].fullPrice!) * cartList[i].qtd!;
    }
    return count.toString();
  }
}
