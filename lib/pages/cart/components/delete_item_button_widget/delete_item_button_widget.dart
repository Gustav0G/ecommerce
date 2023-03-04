import 'package:e_commercex/controller/cart_controller/cart_controller.dart';
import 'package:flutter/material.dart';

class DeleteItemButtonWidget extends StatelessWidget {
  final String id;
  const DeleteItemButtonWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    CartController controller = CartController();
    return IconButton(
      onPressed: (() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Excluir produto'),
                content: const Text(
                    'Deseja excluir este produto do carrinho de compras?'),
                //content: ,
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {
                        controller.deleteProduct(id);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Confirmar',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              );
            });
      }),
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}
