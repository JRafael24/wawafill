import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled/pages/selectedproduct.dart';
import 'package:untitled/services/product.dart';
import 'package:untitled/services/menuCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;

  // 10.0.2.2:8080
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/product/all')
        //Product newProduct = Products.fromJson(date);
        //   return newProduct;
        //if you want to call 1 product
        );
    final data = jsonDecode(response.body);
    print(data);
    List products = <Product>[];
    for (var product in data) {
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
      backgroundColor: Colors.brown[600],
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(
          child: Image.asset('assets/menu.png',
            height: 50.0,
            width: 450.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FutureBuilder(
          future: products,
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitDancingSquare(
                  color: Colors.black,
                  size: 60.0,
                ),
              );
            }

            if (snapshots.hasData) {
              List products = snapshots.data!;
              return Padding(
                padding: EdgeInsets.all(3.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100, // Adjust the height as needed
                      width: double.infinity, // Card takes full width of the ListView
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Card(
                        color: Colors.black,
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                products[index].productName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Price: ${products[index].price.toString()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Selectedproduct(product: products[index]),

                              )
                            );
                            // Add onTap functionality if needed
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return Center(
              child: Text('Unable to load data'),
            );
          },
        ),
      ),
    );
  }
}
