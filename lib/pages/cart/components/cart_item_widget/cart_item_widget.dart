import 'package:e_commercex/model/cart_model/cart_model.dart';
import 'package:e_commercex/pages/cart/components/delete_item_button_widget/delete_item_button_widget.dart';
import 'package:e_commercex/pages/cart/components/qtd_button_widget/qtd_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartProduct;
  const CartItemWidget({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.766,
                  child: Text(
                    cartProduct.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                DeleteItemButtonWidget(
                  id: cartProduct.id!,
                )
              ],
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  child: Image.network(cartProduct.imgUrl!),
                ),
                SizedBox(width: size.width * 0.03),
                SizedBox(
                  width: size.width * 0.22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                            .format(double.parse(cartProduct.discontPrice!)),
                        style: const TextStyle(
                          color: Color(0xff404AA6),
                          //fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        ' Á vista',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size.width * 0.15),
                QtdButtonWidget(
                  qtd: cartProduct.qtd!,
                  id: cartProduct.id!,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
