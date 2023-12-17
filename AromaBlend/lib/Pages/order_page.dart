import 'package:aroma_blend_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  const OrderPage({Key? key, required this.drink}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customize sweetness
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  // customize Ice
  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  // customize Shots
  double shotsValue = 0.5;
  void customizeShots(double newValue) {
    setState(() {
      shotsValue = newValue;
    });
  }

  // add to cart
  void addToCart(){
    // firstly, add to cart
    Provider.of<AromaBlend>(context,listen: false).addToCart(widget.drink);

    // direct user back to shop page
    Navigator.pop(context);

    //let user know it has been successfully added
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Successfully Added To Cart 😘'),

    ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          // drink image
          Image.asset(widget.drink.imagePath),
          // sliders to customize drink
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // sweetness
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text('sweet'),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 3,
                        min: 0,
                        max: 3,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    )
                  ],
                ),
                // ice slide
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text('ICE'),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 5,
                        min: 0,
                        max: 10,
                        onChanged: (value) => customizeIce(value),
                      ),
                    )
                  ],
                ),
                // Shots slide
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text('Shots'),
                    ),
                    Expanded(
                      child: Slider(
                        value: shotsValue,
                        label: shotsValue.toString(),
                        divisions: 2,
                        min: 0,
                        max: 2,
                        onChanged: (value) => customizeShots(value),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // add to cart button
          
            MaterialButton(
              child: Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
              onPressed: addToCart,
            ),
          
        ],
      ),
    );
  }
}
