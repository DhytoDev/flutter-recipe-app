import 'package:moor/moor.dart';

@DataClassName('MealEntity')
class Meals extends Table {
  TextColumn get idMeal => text()();

  TextColumn get strMeal => text()();

  TextColumn get strCategory => text()();

  TextColumn get strMealThumb => text()();

  @override
  Set<Column> get primaryKey => {idMeal};
}
