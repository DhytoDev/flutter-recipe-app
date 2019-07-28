import 'package:core/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/src/di/dependency_injection.dart';
import 'package:food_recipe_app/src/ui/list/favorite_list_page.dart';
import 'package:food_recipe_app/src/ui/list/list_page.dart';

void main() {
  Injection.initInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static MealBloc seafoodBloc = Injection.injector.get<MealBloc>();
  static MealBloc desertBloc = Injection.injector.get<MealBloc>();
  static FavoriteMealBloc favoriteBloc =
      Injection.injector.get<FavoriteMealBloc>();

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    SeafoodListPage(seafoodBloc, 'seafood'),
    DessertListPage(desertBloc, 'dessert'),
    FavoriteListPage(
      bloc: favoriteBloc,
      category: 'Seafood',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    seafoodBloc.dispose();
    desertBloc.dispose();
    favoriteBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Seafood'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            title: Text('Desert'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
