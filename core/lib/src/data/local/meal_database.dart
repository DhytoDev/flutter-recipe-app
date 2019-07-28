import 'package:core/data.dart';
import 'package:moor/moor.dart';

part 'meal_database.g.dart';

@UseMoor(tables: [Meals], daos: [MealDao])
class MealDatabase extends _$MealDatabase {
  MealDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
