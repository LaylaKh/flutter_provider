import 'package:flutter/material.dart';

class ShoppingCartProvider extends ChangeNotifier{
  List<int> shoppingCart = [];

  void addToCart(int index){
    shoppingCart.add(index);
    notifyListeners();
  }

  void removeFromCart(int index){
    shoppingCart.remove(index);
    notifyListeners();
  }
}