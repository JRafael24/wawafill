import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';

class Selectedproduct extends StatefulWidget {
  final Product product;
  const Selectedproduct({super.key, required this.product});

  @override
  State<Selectedproduct> createState() => _SelectedproductState();
}

class _SelectedproductState extends State<Selectedproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        title: Text(
          'Order',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(widget.product.productName),
              Text(widget.product.description),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.product.price.toString()),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      // Add your logic for removing text here
                    },
                  ),
                  SizedBox(width: 8), // Adjust the width as needed for spacing
                  Text('1'), // Replace with your desired text ('1' in this case)
                  SizedBox(width: 8), // Adjust the width as needed for spacing
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Add your logic for adding text here
                    },
                  ),
                ],
              ),
            ],
          )

        ],
      ),
    );
  }
}
