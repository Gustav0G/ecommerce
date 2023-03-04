import 'package:flutter/material.dart';
import '../../../../controller/product_controller/product_controller.dart';
import '../../../../model/product_model/product_model.dart';
import '../products_gridview_widget/products_gridview_widget.dart';

class StorageProductsWidget extends StatefulWidget {
  const StorageProductsWidget({super.key});

  @override
  State<StorageProductsWidget> createState() => _StorageProductsWidgetState();
}

ProductController controller = ProductController();
List<ProductModel> productList = [];

_readList() async {
  productList =
      await controller.readProductByCategory(category: 'Armazenamento');
}

class _StorageProductsWidgetState extends State<StorageProductsWidget> {
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
