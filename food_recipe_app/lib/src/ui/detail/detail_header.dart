import 'package:core/src/model/meal.dart';
import 'package:core/src/model/meal_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailHeader extends StatelessWidget {
  final MealDetail mealDetail;
  final Meal meal;

  const DetailHeader({Key key, @required this.meal, this.mealDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: meal.idMeal,
      child: Material(
        child: Container(
          height: 320,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(meal.strMealThumb), fit: BoxFit.cover),
          ),
          child: IconButton(
            icon: Icon(
              Icons.play_circle_outline,
              size: 70,
              color: Colors.white,
            ),
            onPressed: _playVideo,
          ),
        ),
      ),
    );
  }

  void _playVideo() async {
    final url = mealDetail.strYoutube;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
