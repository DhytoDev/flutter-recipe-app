import 'package:core/data.dart';
import 'package:core/src/data/network/meal_network_data_source.dart';
import 'package:core/src/domain/repositories/meal_repository.dart';
import 'package:core/src/model/meal.dart';
import 'package:core/src/model/meal_detail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/src/observables/observable.dart';

class MealRepositoryImpl extends MealsRepository {
  final MealNetworkDataSource mealNetworkDataSource;
  final MealDao mealDao;

  MealRepositoryImpl(this.mealNetworkDataSource, {this.mealDao});

  @override
  Observable<List<Meal>> getMealsByCategory(String category) {
    return Observable.fromFuture(
            mealNetworkDataSource.getMealsByCategory(category))
        .map((mealResponse) => mealResponse.meals);
  }

  @override
  Observable<MealDetail> getMealDetails(String mealId) {
    return Observable.fromFuture(mealNetworkDataSource.getMealDetails(mealId))
        .map((mealDetailResponse) => mealDetailResponse.meals[0]);
  }

  @override
  Observable<int> addFavoriteMeal(MealEntity mealEntity) {
    return Observable.fromFuture(mealDao.insertMeal(mealEntity));
  }

  @override
  Observable<List<MealEntity>> getFavoriteMealsByCategory(String category) {
    return Observable.fromFuture(mealDao.watchMealsByCategory(category));
  }

  @override
  Observable<MealEntity> findMealById(String mealId) {
    return Observable.fromFuture(mealDao.findMealById(mealId));
  }

  @override
  Observable<int> removeFavoriteMeal(MealEntity mealEntity) {
    return Observable.fromFuture(mealDao.deleteMeal(mealEntity));
  }
}
