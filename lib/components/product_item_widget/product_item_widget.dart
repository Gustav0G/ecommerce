import 'package:e_commercex/components/addcart_button_widget/addcart_button_widget.dart';
import 'package:e_commercex/components/favorite_button_widget/favorite_button_widget.dart';
import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductItemWidget extends StatelessWidget {
  final String? id;
  final ProductModel product;

  const ProductItemWidget({
    super.key,
    required this.product,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.76,
                  child: Text(
                    product.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                FavoriteButtonWidget(
                    isFavorite: product.isFavorite!, id: product.id ?? id!)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      width: size.width * 0.2,
                      child: Image.network(product.imgUrl!)),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'pt_BR', symbol: 'R\$')
                                    .format(
                                        double.parse(product.discontPrice!)),
                                style: const TextStyle(
                                  color: Color(0xff404AA6),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Á vista',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: size.height * 0.055,
                          width: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                      locale: 'pt_BR', symbol: 'R\$')
                                  .format(double.parse(product.fullPrice!)),
                              style: const TextStyle(
                                color: Color(0xff404AA6),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'em até 10x sem juros',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.67,
                      child: AddCartButtonWidget(
                        product: product,
                        id: id,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
