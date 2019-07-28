import 'package:core/bloc.dart';
import 'package:core/model.dart';
import 'package:core/src/domain/interactors/get_meals_use_case.dart';
import 'package:core/src/model/meal.dart';
import 'package:rxdart/rxdart.dart';

class MealBloc extends BaseBloc {
  final GetMealsUseCase _getMealsUseCase;

  final BehaviorSubject<String> _category = BehaviorSubject();

  final BehaviorSubject<List<Meal>> _meals = BehaviorSubject();

  Sink<String> get setCategory => _category.sink;

  Stream<List<Meal>> get getMeals => _meals.stream;

  MealBloc(this._getMealsUseCase) {
    _getMeals();
  }

  void _getMeals() {
    _category.stream.listen(
        (category) => _getMealsUseCase
            .execute(params: category)
            .listen((meals) => _meals.sink.add(meals)),
        onError: (errorMsg) => error.add(errorMsg.toString()));
  }

  @override
  void dispose() {
    super.dispose();
    _category.close();
  }
}
