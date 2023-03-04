import 'package:e_commercex/controller/product_controller/product_controller.dart';
import 'package:e_commercex/controller/promotion_controller/promotion_controller.dart';
import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:e_commercex/model/promotion_model/promotion_model.dart';
import 'package:e_commercex/pages/homepage/components/category_list_bar/category_list_bar.dart';
import 'package:e_commercex/pages/homepage/components/promocional_list_bar/promocional_list_bar.dart';
import 'package:e_commercex/pages/homepage/components/recommend_products_list/recommend_products_list.dart';
import 'package:flutter/material.dart';
import '../../controller/category_controller/category_controller.dart';
import '../../model/category_model/category_mode.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

CategoryController categoryController = CategoryController();
PromotionController promotionController = PromotionController();
ProductController productController = ProductController();
List<CategoryModel> listCategory = [];
List<PromotionModel> listPromotion = [];
List<ProductModel> listRecommend = [];

readLists() async {
  listCategory = await categoryController.readCategory();
}

readPromotion() async {
  listPromotion = await promotionController.readPromotion();
}

readRecommendProducts() async {
  listRecommend = await productController.readRandomProducts();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    readLists();
    readPromotion();
    readRecommendProducts();
    categoryController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      promotionController.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
      productController.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listCategory.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Departamentos',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    CategoryListBarWidget(
                      categoryList: listCategory,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Promoções',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    PromotionListBar(promotionList: listPromotion),
                    const SizedBox(height: 20),
                    const Text(
                      'Recomendado a você',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    RecommendProductsList(productList: listRecommend),
                  ],
                ),
              ),
            ),
    );
  }
}
