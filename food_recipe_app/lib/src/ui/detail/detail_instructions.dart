import 'package:core/src/model/meal_detail.dart';
import 'package:flutter/material.dart';

class DetailInstructions extends StatelessWidget {
  final MealDetail mealDetail;

  const DetailInstructions({Key key, this.mealDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.title;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Instructions', style: titleStyle),
          const SizedBox(height: 10),
          Text(
            mealDetail.strInstructions,
            style: titleStyle.copyWith(
                letterSpacing: 0.5,
                wordSpacing: 0.2,
                fontWeight: FontWeight.normal,
                fontSize: 16),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
