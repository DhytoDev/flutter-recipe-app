import 'package:core/src/model/meal_detail.dart';
import 'package:flutter/material.dart';

class DetailIngredients extends StatelessWidget {
  final MealDetail mealDetail;

  const DetailIngredients({Key key, @required this.mealDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.title;

    final List<String> ingredients = [
      mealDetail.strIngredient1,
      mealDetail.strIngredient2,
      mealDetail.strIngredient3,
      mealDetail.strIngredient4,
      mealDetail.strIngredient5,
      mealDetail.strIngredient6,
      mealDetail.strIngredient7,
      mealDetail.strIngredient8,
      mealDetail.strIngredient9,
      mealDetail.strIngredient10,
      mealDetail.strIngredient11,
      mealDetail.strIngredient12,
      mealDetail.strIngredient13,
      mealDetail.strIngredient14,
      mealDetail.strIngredient15,
      mealDetail.strIngredient16,
      mealDetail.strIngredient17,
      mealDetail.strIngredient18,
      mealDetail.strIngredient19,
      mealDetail.strIngredient20,
    ];
    final List<String> measures = [
      mealDetail.strMeasure1,
      mealDetail.strMeasure2,
      mealDetail.strMeasure3,
      mealDetail.strMeasure4,
      mealDetail.strMeasure5,
      mealDetail.strMeasure6,
      mealDetail.strMeasure7,
      mealDetail.strMeasure8,
      mealDetail.strMeasure9,
      mealDetail.strMeasure10,
      mealDetail.strMeasure11,
      mealDetail.strMeasure12,
      mealDetail.strMeasure13,
      mealDetail.strMeasure14,
      mealDetail.strMeasure15,
      mealDetail.strMeasure16,
      mealDetail.strMeasure17,
      mealDetail.strMeasure18,
      mealDetail.strMeasure19,
      mealDetail.strMeasure20,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Ingredients', style: titleStyle),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < measures.length; i++)
                ingredients[i] != null && ingredients[i] != ""
                    ? ListTile(
                        leading: Text((i + 1).toString()),
                        title: Text(ingredients[i]),
                        trailing: Text(measures[i]),
                      )
                    : Container(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1),
          ),
        ],
      ),
    );
  }
}
