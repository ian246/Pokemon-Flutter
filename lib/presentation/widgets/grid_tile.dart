import 'package:flutter/material.dart';
import 'package:gerenciadeestadoprodutos/models/pokemon.dart';

class GridTileWidget extends StatelessWidget {
  final Pokemon pokemon;
  const GridTileWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(
            pokemon.isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: () {
            pokemon.toogleFavorite();
          },
        ),
        title: Text(pokemon.name, textAlign: TextAlign.center),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ),
      child: Image.network(pokemon.imageUrl, fit: BoxFit.cover),
    );
  }
}
