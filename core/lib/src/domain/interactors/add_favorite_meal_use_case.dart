import 'package:core/data.dart';
import 'package:core/domain.dart';
import 'package:rxdart/rxdart.dart';

class AddFavoriteMealUseCase extends UseCase<String, MealEntity> {
  final MealsRepository _mealsRepository;

  AddFavoriteMealUseCase(this._mealsRepository);

  @override
  Observable<String> execute({MealEntity params}) {
    return _mealsRepository
        .addFavoriteMeal(params)
        .map((resultCode) => 'Add ${params.strMeal} to Favorites')
        .onErrorReturn('Failed to add ${params.strMeal}');
  }
}
