import 'dart:convert';

import 'package:core/src/data/network/endpoints.dart';
import 'package:core/src/model/meal.dart';
import 'package:core/src/model/meal_detail.dart';
import 'package:http/http.dart' as http;

class MealNetworkDataSource {
  MealNetworkDataSource();

  Future<MealResponse> getMealsByCategory(String category) async {
    final String url = '${EndPoints.BASE_URL}filter.php?c=$category';

    var response = await _httpGetRequest(url)
        .then(json.decode)
        .catchError((error) => print(error.toString()));

    return MealResponse.fromJSON(response);
  }

  Future<MealDetailResponse> getMealDetails(String mealId) async {
    final String url = '${EndPoints.BASE_URL}lookup.php?i=$mealId';

    var response = await _httpGetRequest(url)
        .then(json.decode)
        .catchError((error) => print(error.toString()));

    return MealDetailResponse.fromJSON(response);
  }

  Future<String> _httpGetRequest(String url) =>
      http.get(url).then((response) => response.body);
}
