import 'package:core/data.dart';
import 'package:moor/moor.dart';

part 'meal_dao.g.dart';

@UseDao(tables: [Meals])
class MealDao extends DatabaseAccessor<MealDatabase> with _$MealDaoMixin {
  MealDao(MealDatabase db) : super(db);

  Future<List<MealEntity>> getAllMeals() => select(meals).get();

  Future<List<MealEntity>> watchMealsByCategory(String category) =>
      (select(meals)..where((t) => t.strCategory.equals(category))).get();

  Future<int> insertMeal(Insertable<MealEntity> mealEntity) =>
      into(meals).insert(mealEntity, orReplace: true);

  Future<int> deleteMeal(Insertable<MealEntity> mealEntity) =>
      delete(meals).delete(mealEntity);

  Future<MealEntity> findMealById(String mealId) =>
      (select(meals)..where((t) => t.idMeal.equals(mealId))).getSingle();
}
