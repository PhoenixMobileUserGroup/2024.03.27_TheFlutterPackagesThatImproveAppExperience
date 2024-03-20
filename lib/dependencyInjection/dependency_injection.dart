import 'package:get_it/get_it.dart';
import 'package:packages_meetup_demo/repository/implementations/pokemon_repository_impl.dart';
import 'package:packages_meetup_demo/repository/interfaces/pokemon_repository.dart';

final GetIt getItInstance = GetIt.instance;

void setupDependencyInjection() {
  // Repositories
  getItInstance.registerSingleton<PokemonRepository>(PokemonRepositoryImpl());
}