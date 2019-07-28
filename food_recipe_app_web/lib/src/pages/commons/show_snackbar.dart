import 'package:flutter_web/material.dart';

mixin FoodishSnackbar {
  void showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}
