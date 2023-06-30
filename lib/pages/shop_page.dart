import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add shoe to cart
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context,listen: false).addItemToCart(shoe);

    //alert the user,shoe succesfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:Text("Successfully added!"),
        content: Text('check your cart'),

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder:(context, value, child) =>Column(
      children: [
        //search bar
        Container(
          padding:const EdgeInsets.all(12),
          margin:const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(color:Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:const [
              Text('Search',style: TextStyle(color: Colors.grey),),
              Icon(Icons.search,color:Colors.grey),
            ],
          ),
          ),
          //message
          Padding(
            padding: const EdgeInsets.symmetric(vertical:25.0),
            child: Text('everyone flies.. some fly longer than others',
            style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:const [
                Text('Hot Picks 🔥',style:TextStyle( fontWeight:FontWeight.bold,fontSize: 24,color:Colors.orange),
                ),
                Text('see all',
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                ),
              ],
            ),
          ),
           const SizedBox(height:1),
          Expanded(child:ListView.builder(
            itemCount:5,
            scrollDirection: Axis.horizontal,
            itemBuilder:(contxt,index){
            //create a shoe from shop List
            Shoe shoe = value.getShoeList()[index]; 
            //return the shoe
            return ShoeTile(
              shoe: shoe,
              onTap: () => addShoeToCart(shoe),
            ); 
          },
          ),
          ),    
      ],
    ), 
    );
  }
}