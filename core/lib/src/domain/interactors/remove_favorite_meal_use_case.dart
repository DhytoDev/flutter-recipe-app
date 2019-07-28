import 'package:core/data.dart';
import 'package:core/domain.dart';
import 'package:rxdart/src/observables/observable.dart';

class RemoveFavoriteMealUseCase extends UseCase<String, MealEntity> {
  final MealsRepository _mealsRepository;

  RemoveFavoriteMealUseCase(this._mealsRepository);

  @override
  Observable<String> execute({MealEntity params}) {
    return _mealsRepository
        .removeFavoriteMeal(params)
        .map(((resultCode) => 'Remove ${params.strMeal} from Favorites'))
        .onErrorReturn('Failed to remove ${params.strMeal}');
  }
}
