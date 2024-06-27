import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';
import 'package:untitled/services/menuCard.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List products = <Product>[
    Product(productName: "Brandy", price: 999.99),
    Product(productName: "Wine", price: 1499.99),
    Product(productName: "Jack Daniel", price: 2999.99),
    Product(productName: "Vodka", price: 2599.99),
    Product(productName: "Rum", price: 1499.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        foregroundColor: Colors.black,

        title: Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          children: products.map((product) => Menucard(product: product)).toList(),
        ),
      )
    );
  }
}
