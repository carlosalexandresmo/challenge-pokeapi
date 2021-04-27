import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:challenge_pokeapi/models/model_base.dart';
import 'package:challenge_pokeapi/models/result.dart';
import 'package:challenge_pokeapi/services/PokemonRepository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  final _repository = PokemonRepository();

  final _result = BehaviorSubject<List<Result>>();
  Sink<List<Result>> get _resultIn => _result.sink;
  Observable<List<Result>> get results => _result.stream;

  fetchTypes() async {
    try {
      Type type = await _repository.fetchAllTypes();
      List<Result> list = type.results;
      _resultIn.add(list);
    } catch (e) {
      print(e);
    }
  }

  @override
  dispose() {
    super.dispose();
    _resultIn.close();
  }
}
