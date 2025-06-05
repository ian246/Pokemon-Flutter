// lib/services/pokeapi_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';
import '../models/pokemon_species.dart';

class PokeApiService {
  final String baseUrl = 'https://pokeapi.co/api/v2';

  Future<Pokemon> fetchPokemon(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$id'));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }

  Future<PokemonSpecies> fetchPokemonSpecies(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon-species/$id'));
    if (response.statusCode == 200) {
      return PokemonSpecies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokémon species');
    }
  }
}
