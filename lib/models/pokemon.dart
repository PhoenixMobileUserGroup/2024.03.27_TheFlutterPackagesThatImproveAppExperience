import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable(explicitToJson: true)
class Pokemon {
  int id;
  String name;
  String sprite;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
