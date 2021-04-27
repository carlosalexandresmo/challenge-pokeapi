import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:challenge_pokeapi/models/DetailPokemon.dart';
import 'package:challenge_pokeapi/services/PokemonRepository.dart';
import 'package:rxdart/rxdart.dart';

class DetailBloc extends BlocBase {
  final _repository = PokemonRepository();
  //final _typesFetcher = BehaviorSubject<Type>();

  final _pokemon = BehaviorSubject<DetailPokemon>();
  Sink<DetailPokemon> get _pokemonIn => _pokemon.sink;
  Observable<DetailPokemon> get detailPokemon => _pokemon.stream;

  // fetchAllTypes() async {
  //   Type type = await _repository.fetchAllTypes();
  //   _typeIn.add(type);
  // }

  fetchPokemon(id) async {
    try {
      DetailPokemon detailPokemon = await _repository.fetchPokemon(id);
      _pokemonIn.add(detailPokemon);
    } catch (e) {
      print(e);
    }
  }

  @override
  dispose() {
    super.dispose();
    _pokemonIn.close();
  }
}
