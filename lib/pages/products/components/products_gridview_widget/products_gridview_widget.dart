import 'package:e_commercex/components/product_card_widget/product_card_widget.dart';
import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductGrindViewWidget extends StatelessWidget {
  final List<ProductModel> productList;
  const ProductGrindViewWidget({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 285),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return ProductCardWidget(
          product: productList[index],
        );
      },
    );
  }
}
