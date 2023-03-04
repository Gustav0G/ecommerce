import 'package:e_commercex/components/product_item_widget/product_item_widget.dart';
import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

class FavoritesListViewWidget extends StatelessWidget {
  final List<ProductModel> favoriteList;
  const FavoritesListViewWidget({super.key, required this.favoriteList});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.7,
      child: ListView.builder(
          itemCount: favoriteList.length,
          itemBuilder: (BuildContext context, index) {
            return ProductItemWidget(
              id: '',
              product: favoriteList[index],
            );
          }),
    );
  }
}
