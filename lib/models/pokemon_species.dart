// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//! decode: json em map
//! encode: map em json
class PokemonSpecies {
  final String description;
  final String color;
  final String habitat;

  PokemonSpecies({
    required this.description,
    required this.color,
    required this.habitat,
  });

  //!  Desserialização → Converte JSON (da API) para um Objeto
  factory PokemonSpecies.fromJson(Map<String, dynamic> json) {


    //! ➡️ Extrai da API o flavor_text: Idiomas
    final flavorText = (json['flavor_text_entries'] as List).firstWhere(
      (entry) => entry['language']['name'] == 'en',

      orElse: () => {'flavor_text': 'No description available'},
    )['flavor_text'];

    //! ➡️ Extrai da API color e habitat:
    final colorValue = json['color']?['name'] ?? 'unknown';
    final habitat = json['habitat']?['name'] ?? 'unknown';

    //! Retorna uma NOVO(factory) Objeto PokemonSpecies
    return PokemonSpecies(
      description: flavorText,
      color: colorValue,
      habitat: habitat,
    );
  }

  //? ➡️ Serialização → Objeto → Map
  //!     facilita na conversão para JSON,
  //!     Manda para a API
  //!     Salva Localmente
  //!     (exemplo: SharedPreferences)

  Map<String, dynamic> toMap() {
    return {'description': description, 'color': color, 'habitat': habitat};
  }

  //? ➡️ Map → Objeto
  //! Factory, cria uma novo objeto PokemonSpecies partidno de um Map
  //! sqflite, Banco de dados local
  //! SharedPreferences, Armazenamento local
  factory PokemonSpecies.fromMap(Map<String, dynamic> map) {
    return PokemonSpecies(
      description: map['description'] as String,
      color: map['color'] as String,
      habitat: map['habitat'] as String,
    );
  }

  //! ➡️ Serialização → Objeto → String JSON
  //! trandorma em uma String Json
  String toJson() => json.encode(toMap());

 //! ➡️ String JSON → Objeto
 //! Factory, cria um novo objeto PokemonSpecies a partir de uma String JSON
  factory PokemonSpecies.fromJsonString(String source) =>
      PokemonSpecies.fromMap(json.decode(source) as Map<String, dynamic>);
}
