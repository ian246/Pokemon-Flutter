// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pokemon {
  final String id; //! para diferenciar cada produto
  final String name; //! nome do produto
  final String imageUrl;
  bool isFavorite;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false, //! se o produto é favorito ou não
  });

  @override
  String toString() {
    return 'Pokemon(id: $id, title: $name, imageUrl: $imageUrl)';
  }

  void toogleFavorite() {
    isFavorite = !isFavorite;
    //! se ele for um valor e nego com false e ele recebe outro valor
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);
}
