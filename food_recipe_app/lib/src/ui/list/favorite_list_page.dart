import 'package:core/bloc.dart';
import 'package:core/data.dart';
import 'package:flutter/material.dart';

class FavoriteListPage extends StatefulWidget {
  final FavoriteMealBloc bloc;

  final String category;

  const FavoriteListPage({Key key, this.bloc, this.category}) : super(key: key);

  @override
  _FavoriteListPageState createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
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
      body: StreamBuilder(
        stream: widget.bloc.favoriteMeals,
        builder:
            (BuildContext context, AsyncSnapshot<List<MealEntity>> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data.map((meal) => Text(meal.strMeal)).toList(),
          );
        },
      ),
    );
  }
}
