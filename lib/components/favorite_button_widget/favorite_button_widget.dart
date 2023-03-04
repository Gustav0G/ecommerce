import 'package:flutter/material.dart';

import 'package:e_commercex/controller/product_controller/product_controller.dart';

class FavoriteButtonWidget extends StatefulWidget {
  bool isFavorite;
  String id;
  FavoriteButtonWidget({
    Key? key,
    required this.isFavorite,
    required this.id,
  }) : super(key: key);

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  ProductController controller = ProductController();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 1,
      onPressed: () {
        setState(() {
          widget.isFavorite = !widget.isFavorite;
          controller.changeFavoriteProduct(widget.isFavorite, widget.id);
          if (widget.isFavorite == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Produto Adicionado a Lista de Favoritos'),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                content: Text('Produto Retirado da Lista de Favoritos'),
              ),
            );
          }
        });
      },
      icon: Icon(
        widget.isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: const Color(0xff404AA6),
      ),
    );
  }
}
