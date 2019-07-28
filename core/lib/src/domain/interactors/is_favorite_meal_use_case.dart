import 'package:core/domain.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/src/observables/observable.dart';

class IsFavoriteMealUseCase extends UseCase<bool, String> {
  final MealsRepository _mealsRepository;

  IsFavoriteMealUseCase(this._mealsRepository);

  @override
  Observable<bool> execute({String params}) {
    return _mealsRepository
        .findMealById(params)
        .map((meal) => meal != null ? true : false);
  }
}
