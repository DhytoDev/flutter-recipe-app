import 'package:core/bloc.dart';
import 'package:core/data.dart';
import 'package:core/model.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/ui/commons/show_snackbar.dart';

class DetailTop extends StatelessWidget with FoodishSnackbar {
  final MealDetail mealDetail;
  final MealDetailBloc bloc;

  DetailTop({Key key, @required this.mealDetail, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.title;

    bloc.snackBarMessage.listen((message) => showSnackBar(context, message));

    final titleRow = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Text(mealDetail.strMeal,
              textAlign: TextAlign.left,
              style: titleStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 28)),
        ),
        const SizedBox(width: 10),
        StreamBuilder(
          stream: bloc.isFavorite,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) return Container();

            return _buildFavoriteButton(context, snapshot.data);
          },
        ),
      ],
    );

    final chipRow = Row(
      children: <Widget>[
        _buildChip(titleStyle, mealDetail.strCategory),
        const SizedBox(width: 10),
        _buildChip(titleStyle, mealDetail.strArea),
      ],
    );

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleRow,
          const SizedBox(height: 10),
          chipRow,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context, bool isFavorite) => InkWell(
        onTap: () {
          final MealEntity mealEntity = MealEntity(
            strMeal: mealDetail.strMeal,
            idMeal: mealDetail.idMeal,
            strCategory: mealDetail.strCategory,
            strMealThumb: mealDetail.strMealThumb,
          );

          !isFavorite
              ? bloc.addFavoriteMeal(mealEntity)
              : bloc.removeFavoriteMeal(mealEntity);
        },
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.green,
          size: 32,
        ),
      );

  Chip _buildChip(TextStyle titleStyle, String label) {
    return Chip(
      label: Text(label,
          style: titleStyle.copyWith(color: Colors.white, fontSize: 12)),
      backgroundColor: Colors.blue,
      padding: const EdgeInsets.all(4),
    );
  }
}
