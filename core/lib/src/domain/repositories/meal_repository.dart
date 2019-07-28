import 'package:core/data.dart';
import 'package:core/src/model/meal.dart';
import 'package:core/src/model/meal_detail.dart';
import 'package:rxdart/rxdart.dart';

abstract class MealsRepository {
  Observable<List<Meal>> getMealsByCategory(String category);

  Observable<MealDetail> getMealDetails(String mealId);

  Observable<List<MealEntity>> getFavoriteMealsByCategory(String category);

  Observable<int> addFavoriteMeal(MealEntity mealEntity);

  Observable<int> removeFavoriteMeal(MealEntity mealEntity);

  Observable<MealEntity> findMealById(String mealId);
}
