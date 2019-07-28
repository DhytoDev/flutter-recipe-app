import 'package:core/domain.dart';
import 'package:core/src/model/meal_detail.dart';
import 'package:rxdart/rxdart.dart';

class GetMealDetailsUseCase extends UseCase<MealDetail, String> {
  final MealsRepository _mealsRepository;

  GetMealDetailsUseCase(this._mealsRepository);

  @override
  Observable<MealDetail> execute({String params}) {
    return _mealsRepository.getMealDetails(params);
  }
}
