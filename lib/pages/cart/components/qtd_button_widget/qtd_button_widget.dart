import 'package:e_commercex/controller/cart_controller/cart_controller.dart';
import 'package:flutter/material.dart';

class QtdButtonWidget extends StatelessWidget {
  final String id;
  final int qtd;
  const QtdButtonWidget({super.key, required this.id, required this.qtd});

  @override
  Widget build(BuildContext context) {
    CartController controller = CartController();
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xff404AA6),
              radius: 17,
              child: IconButton(
                iconSize: 18,
                onPressed: () {
                  controller.deacreaseProductQtd(id, qtd);
                },
                icon: const Icon(Icons.remove),
              ),
            ),
            SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  qtd.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: const Color(0xff404AA6),
              radius: 17,
              child: IconButton(
                iconSize: 18,
                onPressed: () {
                  controller.increaseProductQtd(id, qtd);
                },
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Text(
          'Quantidade',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
