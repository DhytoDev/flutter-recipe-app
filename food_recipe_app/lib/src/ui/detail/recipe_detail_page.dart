import 'package:core/bloc.dart';
import 'package:core/model.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/di/dependency_injection.dart';
import 'package:food_recipe_app/src/ui/detail/detail_header.dart';
import 'package:food_recipe_app/src/ui/detail/detail_ingredients.dart';
import 'package:food_recipe_app/src/ui/detail/detail_instructions.dart';
import 'package:food_recipe_app/src/ui/detail/detail_top.dart';

class RecipeDetailPage extends StatefulWidget {
  final Meal meal;

  RecipeDetailPage({@required this.meal});

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final MealDetailBloc bloc = Injection.injector.get<MealDetailBloc>();

  @override
  void initState() {
    super.initState();
    bloc.setMealId.add(widget.meal.idMeal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.errorStream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (!snapshot.hasData) return _streamMealDetails();

          return Center(child: Text(snapshot.data));
        },
      ),
    );
  }

  Widget _streamMealDetails() => StreamBuilder(
        stream: bloc.getMealDetails,
        builder: (BuildContext context, AsyncSnapshot<MealDetail> snapshot) {
          final MealDetail mealDetail = snapshot.data;

          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                MealAppBar(meal: widget.meal, mealDetail: mealDetail),
              ];
            },
            body: !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: <Widget>[
                      DetailTop(
                        mealDetail: mealDetail,
                        bloc: bloc,
                      ),
                      DetailIngredients(mealDetail: mealDetail),
                      DetailInstructions(mealDetail: mealDetail),
                    ],
                  ),
          );
        },
      );
}

class MealAppBar extends StatelessWidget {
  final MealDetail mealDetail;
  final Meal meal;

  const MealAppBar({Key key, this.meal, this.mealDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 275,
      flexibleSpace: DetailHeader(
        mealDetail: mealDetail,
        meal: meal,
      ),
    );
  }
}
