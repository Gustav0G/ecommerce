import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../addcart_button_widget/addcart_button_widget.dart';
import '../favorite_button_widget/favorite_button_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: size.width * 0.44,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            SizedBox(
              width: 70,
              child: Image.network(product.imgUrl!),
            ),
            const SizedBox(height: 10),
            SizedBox(
                height: size.height * 0.09,
                child: Text(
                  product.name!,
                  style: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                          .format(double.parse(product.discontPrice!)),
                      style: const TextStyle(
                          color: Color(0xff404AA6),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Á vista',
                      style: TextStyle(color: Colors.black38),
                    )
                  ],
                ),
                FavoriteButtonWidget(
                  isFavorite: product.isFavorite!,
                  id: product.id!,
                )
              ],
            ),
            AddCartButtonWidget(
              product: product,
              id: '',
            )
          ],
        ),
      ),
    );
  }
}
