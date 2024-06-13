import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/button.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/models/shop.dart';
import 'package:restaurant/theme/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;

  //decrement  quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increment quantity

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }
  //add to cart method

  void addtoCart() {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addtoCart(widget.food, quantityCount);
      //let the user know  if was  successfull
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: primaryColor,
                content: const Text(
                  "Successfully added to cart",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      //pop one  to remove  dialog box
                      Navigator.pop(context);
                      //pop again to go to previous screen
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.done , color: Colors.white,),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview  of food detail
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // rating
                  Row(
                    children: [
                      //star
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),

                      const SizedBox(
                        width: 5,
                      ),

                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // description
                  Text(
                    "Descriptions",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Text(
                    "Delicate, thinly sliced fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. The salmon, known for its buttery texture and rich flavor, complements the subtly sweet and tangy rice, creating a harmonious blend of taste and texture. Each piece is a work of art, meticulously crafted to provide a balance of freshness and umami. The vibrant orange hue of the salmon contrasts beautifully with the pristine white rice,",
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 14, height: 2),
                  ),
                ],
              ),
            ),
          ),

          //price  + quantity +add to cart button
          Container(
            padding:const EdgeInsets.all(25),
            color: primaryColor,
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      "\$" + widget.food.price,
                      style:const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),

                    //quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon:const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //add to cart button
                Mybutton(text: "Add to Cart", onTap: addtoCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
