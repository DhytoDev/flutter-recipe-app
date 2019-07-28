import 'package:core/bloc.dart';
import 'package:core/data.dart';
import 'package:core/domain.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:food_recipe_app/src/data/flutter_meal_db.dart';

class Injection {
  static Injector injector;

  static void initInjection() {
    injector = Injector.getInjector();

    injector.map<MealNetworkDataSource>((i) => MealNetworkDataSource());

    injector.map<MealDao>((i) => MealDao(AppDatabase()));

    injector.map<MealsRepository>((i) => MealRepositoryImpl(
        MealNetworkDataSource(),
        mealDao: injector.get<MealDao>()));

    injector.map<GetMealsUseCase>(
        (i) => GetMealsUseCase(injector.get<MealsRepository>()));

    injector.map<GetMealDetailsUseCase>(
        (i) => GetMealDetailsUseCase(injector.get<MealsRepository>()));

    injector.map<GetFavoriteMealUseCase>(
        (i) => GetFavoriteMealUseCase(injector.get<MealsRepository>()));

    injector.map<AddFavoriteMealUseCase>(
        (i) => AddFavoriteMealUseCase(injector.get<MealsRepository>()));

    injector.map<IsFavoriteMealUseCase>(
        (i) => IsFavoriteMealUseCase(injector.get<MealsRepository>()));

    injector.map<RemoveFavoriteMealUseCase>(
        (i) => RemoveFavoriteMealUseCase(injector.get<MealsRepository>()));

    injector.map<MealBloc>((i) => MealBloc(injector.get<GetMealsUseCase>()),
        isSingleton: false);

    injector.map<FavoriteMealBloc>(
        (i) => FavoriteMealBloc(injector.get<GetFavoriteMealUseCase>()),
        isSingleton: false);

    injector.map<MealDetailBloc>(
        (i) => MealDetailBloc(
            injector.get<GetMealDetailsUseCase>(),
            injector.get<AddFavoriteMealUseCase>(),
            injector.get<IsFavoriteMealUseCase>(),
            injector.get<RemoveFavoriteMealUseCase>()),
        isSingleton: false);
  }
}
