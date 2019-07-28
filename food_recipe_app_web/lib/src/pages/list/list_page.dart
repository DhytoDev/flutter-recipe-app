import 'package:core/src/bloc/meal_bloc.dart';

import 'base_recipe_list_page.dart';

class DessertListPage extends RecipeListPage {
  DessertListPage(MealBloc bloc, String category) : super(bloc, category);
}

class SeafoodListPage extends RecipeListPage {
  SeafoodListPage(MealBloc bloc, String category) : super(bloc, category);
}
