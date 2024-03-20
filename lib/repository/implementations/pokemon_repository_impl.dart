import 'package:packages_meetup_demo/models/pokemon.dart';

import '../../models/dtos/get_pokemon_dto.dart';
import '../interfaces/pokemon_repository.dart';


class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<List<Pokemon>> getPokemon() async {
    await _delay(2000); // Delay for 2000 milliseconds (2 seconds)
    return GetPokemonDTO.fromJson(_mockResponse).results;
  }

  /// Creates an artificial delay to simulate waiting for a response
  Future<void> _delay(int milliseconds) {
    return Future.delayed(Duration(milliseconds: milliseconds));
  }

  final Map<String, dynamic> _mockResponse = {
    "results": [
      {
        "id": 1,
        "name": "Bulbasaur",
        "sprite":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
      },
      {
        "id": 2,
        "name": "Ivysaur",
        "sprite":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png"
      },
      {
        "id": 3,
        "name": "Venusaur",
        "sprite":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"
      },
      {
        "id": 4,
        "name": "Charmander",
        "sprite":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"
      },
      {
        "id": 5,
        "name": "Charmeleon",
        "sprite":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png"
      },
      {
        "id": 6,
        "name": "Charizard",
        "sprite":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png"
      },
      {
        "id": 7,
        "name": "Squirtle",
        "sprite":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png"
      },
      {
        "id": 8,
        "name": "Wartortle",
        "sprite":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png"
      },
      {
        "id": 9,
        "name": "Blastoise",
        "sprite":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/912314.png"
      },
    ]
  };
}
