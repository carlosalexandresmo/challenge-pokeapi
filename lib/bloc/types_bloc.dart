import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:challenge_pokeapi/models/list_pokemon.dart';
import 'package:challenge_pokeapi/models/type_detail.dart';
import 'package:challenge_pokeapi/services/PokemonRepository.dart';
import 'package:rxdart/rxdart.dart';

class TypesBloc extends BlocBase {
  final _repository = PokemonRepository();

  final _typeDetail = BehaviorSubject<List<ListPokemon>>();
  Sink<List<ListPokemon>> get _typeDetailIn => _typeDetail.sink;
  Observable<List<ListPokemon>> get allPokemons => _typeDetail.stream;

  fetchType(id) async {
    try {
      TypeDetail typeDetail = await _repository.fetchType(id);
      List<ListPokemon> list = typeDetail.pokemon;
      _typeDetailIn.add(list);
    } catch (e) {
      print(e);
    }
  }

  @override
  dispose() {
    super.dispose();
    _typeDetailIn.close();
  }
}
