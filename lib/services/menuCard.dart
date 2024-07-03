import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';

class Menucard extends StatelessWidget {
  final Product product;

  Menucard({required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 450,

      child: Card(
        color: Colors.lightBlue[700],
        child: Padding(
          padding: const EdgeInsets.all(12.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(product.productName,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
              Text('${product.price}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
