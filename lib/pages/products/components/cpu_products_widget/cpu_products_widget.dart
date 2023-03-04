import 'package:flutter/material.dart';
import '../../../../controller/product_controller/product_controller.dart';
import '../../../../model/product_model/product_model.dart';
import '../products_gridview_widget/products_gridview_widget.dart';

class CpuProductsWidget extends StatefulWidget {
  const CpuProductsWidget({super.key});

  @override
  State<CpuProductsWidget> createState() => _CpuProductsWidgetState();
}

ProductController controller = ProductController();
List<ProductModel> productList = [];

_readList() async {
  productList = await controller.readProductByCategory(category: 'Cpu');
}

class _CpuProductsWidgetState extends State<CpuProductsWidget> {
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
