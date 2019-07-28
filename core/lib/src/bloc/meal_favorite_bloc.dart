import 'package:core/bloc.dart';
import 'package:core/data.dart';
import 'package:core/domain.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteMealBloc extends BaseBloc {
  final GetFavoriteMealUseCase _getFavoriteMealUseCase;

  final BehaviorSubject<List<MealEntity>> _favoriteMeals = BehaviorSubject();

  final BehaviorSubject<String> _category = BehaviorSubject();

  Stream<List<MealEntity>> get favoriteMeals => _favoriteMeals.stream;

  Sink<String> get setCategory => _category.sink;

  FavoriteMealBloc(this._getFavoriteMealUseCase) {
    _getFavoriteMeals();
  }

  void _getFavoriteMeals() {
    _category.stream.listen((category) => _getFavoriteMealUseCase
        .execute(params: category)
        .listen((favorites) => _favoriteMeals.sink.add(favorites),
            onError: (errorMsg) => error.add(errorMsg.toString())));
  }

  @override
  void dispose() {
    super.dispose();
    _favoriteMeals.close();
    _category.close();
  }
}
