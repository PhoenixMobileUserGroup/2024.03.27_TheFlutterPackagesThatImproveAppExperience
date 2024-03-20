import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:packages_meetup_demo/repository/interfaces/pokemon_repository.dart';
import 'package:packages_meetup_demo/ui/components/shimmer_container_widget.dart';
import 'package:packages_meetup_demo/ui/dialogs/pokemon_details_dialog.dart';

import '../models/pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBusy = true;
  List<Pokemon> pokemon = [];
  PokemonRepository pokemonRepository = GetIt.instance<PokemonRepository>();

  @override
  void initState() {
    asyncInit();
    super.initState();
  }

  Future asyncInit() async {
    try {
      pokemon = await pokemonRepository.getPokemon();
    } finally {
      setState(() {
        isBusy = false;
      });
    }
  }

  void onPokemonSelectedCommand(Pokemon selectedPokemon) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          PokemonDetailsDialog(pokemon: selectedPokemon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pokedex"),
      ),
      body: ListView.builder(
          itemCount: isBusy ? 10 : pokemon.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: isBusy
                  ? const ShimmerContainer()
                  : Card(
                      margin: EdgeInsets.zero,
                      child: ListTile(
                        onTap: () => onPokemonSelectedCommand(pokemon[index]),
                        leading: CachedNetworkImage(
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          imageUrl: pokemon[index].sprite ?? "",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(FontAwesomeIcons.circleExclamation),
                        ),
                        title: Text(pokemon[index].name),
                        subtitle: Text("#${pokemon[index].id.toString()}"),
                      ),
                    ),
            );
          }),
    );
  }
}
