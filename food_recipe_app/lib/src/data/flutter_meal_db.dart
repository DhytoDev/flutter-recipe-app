import 'package:core/data.dart';
import 'package:moor_flutter/moor_flutter.dart';

class AppDatabase extends MealDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'meal.sqlite',
          logStatements: true,
        ));
}
