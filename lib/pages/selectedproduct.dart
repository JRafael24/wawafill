import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';

class Selectedproduct extends StatefulWidget {
  final Product product;
  const Selectedproduct({super.key, required this.product});

  @override
  State<Selectedproduct> createState() => _SelectedproductState(product: product);
}

class _SelectedproductState extends State<Selectedproduct> {
  final Product product;
  late double totalAmount;
  int numberOfOrders = 1;
  _SelectedproductState({required this.product});

  @override
  void initState(){
    super.initState();
    totalAmount = product.price;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[600],
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
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white, width: 15.0), // top side
            bottom: BorderSide(color: Colors.green, width: 15.0), // bottom side
            left: BorderSide(color: Colors.yellow, width: 15.0), // left side
            right: BorderSide(color: Colors.red, width: 15.0), // right side
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.product.productName,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.product.description,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,

                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 600,
                      height: 400,
                      child: Image.network(product.url),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₱${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                Row(
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

                    Text(
                      numberOfOrders.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),

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
              ],
            ),
          ],
        ),
      ),
    );



  }
}
