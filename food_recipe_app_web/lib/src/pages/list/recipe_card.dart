import 'package:core/src/model/meal.dart';
import 'package:flutter_web/material.dart';
import 'package:food_recipe_app_web/src/pages/commons/show_snackbar.dart';

class RecipeCard extends StatelessWidget with FoodishSnackbar {
  final Meal meal;

  const RecipeCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.body1;

    return InkWell(
      onTap: () => _showDetail(context),
      child: Hero(
        tag: meal.idMeal,
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  meal.strMealThumb,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.7,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    constraints: BoxConstraints(maxHeight: 50),
                    color: Colors.pink,
                    child: Text(
                      meal.strMeal,
                      textAlign: TextAlign.center,
                      style: textStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    showSnackBar(context, meal.strMeal);
    /*Future.delayed(Duration(milliseconds: 500)).then((_) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => RecipeDetailPage(meal: meal),
        ),
      );
    });*/
  }
}
