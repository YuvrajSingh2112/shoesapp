import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {

// list of shoes for sale
List<Shoe> shoeShop =[
  Shoe(name:'Air Jordan',
   price: '1500',
   description:'The Forawrd-Thinking Design Of His Latest Singnature Shoe',
   imagepath:'lib/images/airjordan4.png'),

   Shoe(name:'Air Jordan',
   price: '1700',
   description:'  The Forawrd-Thinking Design Of His Latest Singnature Shoe',
   imagepath:'lib/images/airjordan3.png'),

   Shoe(name:'Air Jordan',
   price: '1600',
   description:'The Forawrd-Thinking Design Of His Latest Singnature Shoe ',
   imagepath:'lib/images/airjordan1.png'),

    Shoe(name:'Air Jordan',
   price: '1800',
   description:' The Forawrd-Thinking Design Of His Latest Singnature Shoe',
   imagepath:'lib/images/airjordan.png'),

   Shoe(name:'Air Jordan',
   price: '1900',
   description:' The Forawrd-Thinking Design Of His Latest Singnature Shoe',
   imagepath:'lib/images/airjordan2.png'),
  
];

// list of items in user cart 
List<Shoe> userCart =[];

//get list of Shoes for sale
List<Shoe> getShoeList(){
  return shoeShop;
}

// get cart
List<Shoe> getUserCart(){
  return userCart;
}

// add item to cart 
void addItemToCart(Shoe shoe){
  userCart.add(shoe);
  notifyListeners();
}

// remove item from cart
void removeItemFromCart(Shoe shoe){
  userCart.remove(shoe);
  notifyListeners();
}
}