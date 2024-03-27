import 'package:json_annotation/json_annotation.dart';
import 'package:packages_meetup_demo/models/pokemon.dart';

part 'get_pokemon_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPokemonDTO {
  List<Pokemon> results;

  GetPokemonDTO({
    required this.results,
  });

  factory GetPokemonDTO.fromJson(Map<String, dynamic> json) =>
      _$GetPokemonDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetPokemonDTOToJson(this);
}
