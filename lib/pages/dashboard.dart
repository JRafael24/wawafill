import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List listBanners = [
    "assets/topsilog.jpg",
    "assets/tocilog.jpg",
    "assets/hotsilog.jpg",
    "assets/siosilog.jpg",
    "assets/longsilog.jpg",
    "assets/sisilog.jpg",
    "assets/chicsilog.jpg",
    "assets/bangsilog.jpg",
    "assets/hamsilog.jpg",
  ];

  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/rasta.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: Center(
                child: Image.asset(
                  'assets/appbar.png',
                  height: 80.0,
                  width: 600.0,
                ),
              ),
              backgroundColor: Colors.black,
              centerTitle: false,
              automaticallyImplyLeading: false,
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                  Expanded(
                    child: CarouselSlider(
                      items: listBanners.map((banner) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(banner),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 600,
                        initialPage: 0,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentSlide = index;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        onTap: (int val) {
          switch (val) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/menu');
              break;
          }
        },
        currentIndex: 0,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_sharp, color: Colors.black),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
