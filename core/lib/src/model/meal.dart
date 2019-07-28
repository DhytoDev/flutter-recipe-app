class MealResponse {
  final List<Meal> meals;

  MealResponse(this.meals);

  MealResponse.fromJSON(Map<String, dynamic> json)
      : meals =
            (json['meals'] as List).map((json) => Meal.fromJSON(json)).toList();
}

class Meal {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  Meal(this.strMeal, this.strMealThumb, this.idMeal);

  Meal.fromJSON(Map<String, dynamic> json)
      : strMeal = json['strMeal'],
        strMealThumb = json['strMealThumb'],
        idMeal = json['idMeal'];
}
