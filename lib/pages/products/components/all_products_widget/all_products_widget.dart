import 'package:e_commercex/controller/product_controller/product_controller.dart';
import 'package:e_commercex/pages/products/components/products_gridview_widget/products_gridview_widget.dart';
import 'package:flutter/material.dart';
import '../../../../model/product_model/product_model.dart';

class AllProdcutsWidget extends StatefulWidget {
  const AllProdcutsWidget({super.key});

  @override
  State<AllProdcutsWidget> createState() => _AllProdcutsWidgetState();
}

ProductController controller = ProductController();
List<ProductModel> productList = [];

_readList() async {
  productList = await controller.readProducts();
}

class _AllProdcutsWidgetState extends State<AllProdcutsWidget> {
  @override
  void initState() {
    _readList();
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return productList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ProductGrindViewWidget(productList: productList);
  }
}
