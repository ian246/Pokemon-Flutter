import 'package:flutter/material.dart';

import '../widgets/grid_tile.dart';

class ProductsOverViewPage extends StatelessWidget {
  //! alterar essa parte de pokemo para puxar na API

  const ProductsOverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Shop')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //! colunas
          childAspectRatio: 3 / 2, //! proporção
          crossAxisSpacing: 10, // Espaçamento horizontal entre os itens
          mainAxisSpacing: 10, // Espaçamento vertical entre os itens
        ),
        itemBuilder: (ctx, i) => GridTileWidget(pokemon: null!),
      ),
    );
  }
}
