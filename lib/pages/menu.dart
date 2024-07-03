import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/services/product.dart';
import 'package:untitled/services/menuCard.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  // 10.0.2.2:8080
  Future<List<dynamic>> fetchData() async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/products')
            //Product newProduct = Products.fromJson(date);
    //   return newProduct;
      //if you want to call 1 product
    );
    final data = jsonDecode(response.body);
    List products = <Product>[];
    for(var product in data){
      products.add(Product.fromJson(product));
    }
    return products;
  }

  @override
  void initState() {
    super.initState();
    products = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
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

    );
  }
}
