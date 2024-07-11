import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';

class Selectedproduct extends StatefulWidget {
  final Product product;
  const Selectedproduct({Key? key, required this.product}) : super(key: key);

  @override
  State<Selectedproduct> createState() => _SelectedproductState(product: product);
}

class _SelectedproductState extends State<Selectedproduct> {
  late double totalAmount;
  int numberOfOrders = 1;
  final Product product;

  _SelectedproductState({required this.product}) {
    totalAmount = product.price; // Initialize totalAmount with product price
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            'assets/menu.png',
            height: 50.0,
            width: 450.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bamboo.jpg'), // Replace with your background image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Container(
                    width: 400,
                    height: 500,
                    child: Image.network(
                      product.url,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    '₱${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (numberOfOrders > 1) {
                              numberOfOrders -= 1;
                              totalAmount = product.price * numberOfOrders;
                            }
                          });
                        },
                        icon: Icon(Icons.remove, color: Colors.white),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        numberOfOrders.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            numberOfOrders += 1;
                            totalAmount = product.price * numberOfOrders;
                          });
                        },
                        icon: Icon(Icons.add, color: Colors.white),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  // Implement add to cart functionality here
                  // You can use Navigator to navigate to the cart screen or show a snackbar
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  backgroundColor: Colors.black, // Change background color to black
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  minimumSize: Size(double.infinity, 50), // Set minimumSize to stretch button
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Change text color to white
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
