import 'package:core/bloc.dart';
import 'package:core/model.dart';
import 'package:flutter_web/material.dart';

import 'recipe_card.dart';

class RecipeListPage extends StatefulWidget {
  final MealBloc bloc;
  final String category;

  RecipeListPage(this.bloc, this.category, {Key key}) : super(key: key);

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.setCategory.add(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('FOOD'),
            Icon(Icons.restaurant_menu),
            Text('SH'),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
          stream: widget.bloc.errorStream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) return _streamMeals();

            return Center(child: Text(snapshot.data));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _streamMeals() => StreamBuilder(
        stream: widget.bloc.getMeals,
        builder: (BuildContext context, AsyncSnapshot<List<Meal>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return GridView.count(
            padding: const EdgeInsets.all(16),
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children:
                snapshot.data.map((meal) => RecipeCard(meal: meal)).toList(),
          );
        },
      );
}
