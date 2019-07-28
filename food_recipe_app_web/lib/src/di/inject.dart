import 'package:core/bloc.dart';
import 'package:core/data.dart';
import 'package:core/domain.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class Injection {
  static Injector injector;

  static void initInjection() {
    injector = Injector.getInjector();

    injector.map<MealNetworkDataSource>((i) => MealNetworkDataSource());

    injector.map<MealsRepository>((i) =>
        MealRepositoryImpl(MealNetworkDataSource()));

    injector.map<GetMealsUseCase>(
        (i) => GetMealsUseCase(injector.get<MealsRepository>()));

    injector.map<MealBloc>((i) => MealBloc(injector.get<GetMealsUseCase>()),
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
