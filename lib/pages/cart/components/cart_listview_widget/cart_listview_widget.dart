import 'package:e_commercex/model/cart_model/cart_model.dart';
import 'package:e_commercex/pages/cart/components/cart_item_widget/cart_item_widget.dart';
import 'package:flutter/cupertino.dart';

class CartListViewWidget extends StatelessWidget {
  final List<CartModel> cartProductList;
  const CartListViewWidget({super.key, required this.cartProductList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: size.height * 0.1,
      child: ListView.builder(
          itemCount: cartProductList.length,
          itemBuilder: (BuildContext context, index) {
            return CartItemWidget(cartProduct: cartProductList[index]);
          }),
    );
  }
}
