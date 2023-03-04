import 'package:flutter/material.dart';
import '../../../../controller/product_controller/product_controller.dart';
import '../../../../model/product_model/product_model.dart';
import '../products_gridview_widget/products_gridview_widget.dart';

class GpuProductsWidget extends StatefulWidget {
  const GpuProductsWidget({super.key});

  @override
  State<GpuProductsWidget> createState() => _GpuProductsWidgetState();
}

ProductController controller = ProductController();
List<ProductModel> productList = [];

_readList() async {
  productList = await controller.readProductByCategory(category: 'Gpu');
}

class _GpuProductsWidgetState extends State<GpuProductsWidget> {
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
