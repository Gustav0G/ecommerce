import 'package:e_commercex/pages/products/components/all_products_widget/all_products_widget.dart';
import 'package:e_commercex/pages/products/components/cpu_products_widget/cpu_products_widget.dart';
import 'package:e_commercex/pages/products/components/gpu_products_widget/gpu_products_widget.dart';
import 'package:e_commercex/pages/products/components/memory_products_widget/memory_products_widget.dart';
import 'package:e_commercex/pages/products/components/motherboard_products_widget/motherboard_products_widget.dart';
import 'package:e_commercex/pages/products/components/storage_products_widget/storage_products_widgets.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  final int tabIndex;
  const ProductsPage({super.key, required this.tabIndex});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 6, vsync: this);
    tabController.animateTo(widget.tabIndex);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Produtos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    //letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TabBar(
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black26,
                  indicatorWeight: 2.5,
                  indicatorColor: const Color(0xff404AA6),
                  indicatorPadding: const EdgeInsets.only(left: 16),
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      text: 'Todos',
                    ),
                    Tab(text: 'Armazenamento'),
                    Tab(text: 'Processador'),
                    Tab(text: 'Placas de Video'),
                    Tab(text: 'Memória Ram'),
                    Tab(text: 'Placa Mãe'),
                  ]),
              SizedBox(
                //width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.67,
                child: TabBarView(controller: tabController, children: const [
                  AllProdcutsWidget(),
                  StorageProductsWidget(),
                  CpuProductsWidget(),
                  GpuProductsWidget(),
                  MemoryProductsWidget(),
                  MotherboardProductsWidget()
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
