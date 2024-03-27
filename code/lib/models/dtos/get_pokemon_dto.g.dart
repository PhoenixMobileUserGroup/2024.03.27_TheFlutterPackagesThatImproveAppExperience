// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPokemonDTO _$GetPokemonDTOFromJson(Map<String, dynamic> json) =>
    GetPokemonDTO(
      results: (json['results'] as List<dynamic>)
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPokemonDTOToJson(GetPokemonDTO instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
