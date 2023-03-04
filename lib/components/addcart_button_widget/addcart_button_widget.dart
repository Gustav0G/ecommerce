import 'package:e_commercex/controller/cart_controller/cart_controller.dart';
import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

class AddCartButtonWidget extends StatelessWidget {
  final ProductModel product;
  final String? id;
  const AddCartButtonWidget(
      {super.key, required this.product, required this.id});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff404AA6),
          elevation: 1,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      onPressed: () {
        CartController controller = CartController();
        controller.addItemToCart(product, id!);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Produto adicionado ao carrinho'),
          duration: Duration(seconds: 1),
        ));
      },
      icon: const Icon(Icons.shopping_cart),
      label: const Text(
        'Comprar',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
