import 'package:flutter/material.dart';

class EmptyCardMessage extends StatelessWidget {
  const EmptyCardMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Carrinho  de Compras Vazio',
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    ));
  }
}
