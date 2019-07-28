import 'package:core/domain.dart';
import 'package:core/model.dart';
import 'package:core/src/domain/repositories/meal_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetMealsUseCase extends UseCase<List<Meal>, String> {
  final MealsRepository mealsRepository;

  GetMealsUseCase(this.mealsRepository);

  @override
  Observable<List<Meal>> execute({String params}) {
    return mealsRepository.getMealsByCategory(params);
  }
}
