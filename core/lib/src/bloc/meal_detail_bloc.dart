import 'package:core/bloc.dart';
import 'package:core/data.dart';
import 'package:core/domain.dart';
import 'package:core/model.dart';
import 'package:core/src/domain/interactors/is_favorite_meal_use_case.dart';
import 'package:rxdart/rxdart.dart';

class MealDetailBloc extends BaseBloc {
  final GetMealDetailsUseCase _getMealDetailsUseCase;
  final AddFavoriteMealUseCase _addFavoriteMealUseCase;
  final IsFavoriteMealUseCase _isFavoriteMealUseCase;
  final RemoveFavoriteMealUseCase _removeFavoriteMealUseCase;

  final BehaviorSubject<String> _mealId = BehaviorSubject();

  final BehaviorSubject<MealDetail> _mealDetail = BehaviorSubject();

  final BehaviorSubject<bool> _isFavorite = BehaviorSubject();

  final BehaviorSubject<String> _snackBarMessage = BehaviorSubject();

  Sink<String> get setMealId => _mealId.sink;

  Stream<bool> get isFavorite => _isFavorite.stream;

  Stream<MealDetail> get getMealDetails => _mealDetail.stream;

  Stream<String> get snackBarMessage => _snackBarMessage.stream;

  MealDetailBloc(this._getMealDetailsUseCase, this._addFavoriteMealUseCase,
      this._isFavoriteMealUseCase, this._removeFavoriteMealUseCase) {
    _getMealDetails();
  }

  void _getMealDetails() {
    _mealId.stream.listen(
      (mealId) {
        _getMealDetailsUseCase.execute(params: mealId).listen(
            (mealDetail) => _mealDetail.sink.add(mealDetail),
            onError: (errorMsg) => error.add(errorMsg.toString()));

        _isFavoriteMeal(mealId);
      },
    );
  }

  void addFavoriteMeal(MealEntity mealEntity) {
    _addFavoriteMealUseCase.execute(params: mealEntity).listen((result) {
      _isFavorite.sink.add(true);
      _snackBarMessage.sink.add(result);
    }, onError: (error) => print(error.toString()));
  }

  void removeFavoriteMeal(MealEntity mealEntity) {
    _removeFavoriteMealUseCase.execute(params: mealEntity).listen((result) {
      _isFavorite.sink.add(false);
      _snackBarMessage.sink.add(result);
    }, onError: (error) => print(error.toString()));
  }

  void _isFavoriteMeal(String mealId) => _isFavoriteMealUseCase
      .execute(params: mealId)
      .listen((isFavorite) => _isFavorite.sink.add(isFavorite));

  @override
  void dispose() {
    super.dispose();
    _mealId.close();
    _mealDetail.close();
    _isFavorite.close();
    _snackBarMessage.close();
  }
}
