import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../components/product_card_widget/product_card_widget.dart';

class RecommendProductsList extends StatelessWidget {
  final List<ProductModel> productList;
  const RecommendProductsList({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.375,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (BuildContext context, index) {
          return ProductCardWidget(
            product: productList[index],
          );
        },
      ),
    );
  }
}
