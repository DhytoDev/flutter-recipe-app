import 'package:core/data.dart';
import 'package:core/domain.dart';
import 'package:rxdart/src/observables/observable.dart';

class GetFavoriteMealUseCase extends UseCase<List<MealEntity>, String> {
  final MealsRepository _mealsRepository;

  GetFavoriteMealUseCase(this._mealsRepository);

  @override
  Observable<List<MealEntity>> execute({String params}) {
    return _mealsRepository.getFavoriteMealsByCategory(params);
  }
}
