import 'package:e_commercex/controller/product_controller/product_controller.dart';
import 'package:e_commercex/model/product_model/product_model.dart';
import 'package:e_commercex/pages/favorites/components/favorites_listview_widget/favorites_listview_widget.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  ProductController controller = ProductController();
  List<ProductModel> favoriteList = [];

  readList() async {
    favoriteList = await controller.readFavoriteProducts();
  }

  @override
  void initState() {
    readList();

    controller.addListener(() {
      if (mounted) {
        readList();

        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoriteList.isEmpty == true
          ? const Center(
              child: Text(
                'Sua lista  de Favoritos Está vazia',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Favoritos (${favoriteList.length})',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FavoritesListViewWidget(favoriteList: favoriteList),
                  ],
                ),
              ),
            ),
    );
  }
}
