import 'package:flutter/material.dart';
import 'package:banner_carousel/banner_carousel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<BannerModel> listBanners = [
    BannerModel(imagePath: "assets/topsilog.jpg", id: "1"),
    BannerModel(imagePath: "assets/tocilog.jpg", id: "2"),
    BannerModel(imagePath: "assets/hotsilog.jpg", id: "3"),
    BannerModel(imagePath: "assets/siosilog.jpg", id: "4"),
    BannerModel(imagePath: "assets/longsilog.jpg", id: "5"),
    BannerModel(imagePath: "assets/sisilog.jpg", id: "6"),
    BannerModel(imagePath: "assets/chicsilog.jpg", id: "7"),
    BannerModel(imagePath: "assets/bangsilog.jpg", id: "8"),
    BannerModel(imagePath: "assets/hamsilog.jpg", id: "9"),
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[600],
      appBar: AppBar(
        title: Center(
          child: Image.asset('assets/appbar.png',
          height: 60.0,
            width: 500.0,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Image.asset(
            //   'assets/sisleng.jpg',  // Replace with your actual image path
            //   width: 500,
            //   height: 250,
            //   fit: BoxFit.contain,
            // ),

            SizedBox(height: 25,),
            BannerCarousel(
              banners: listBanners,
              customizedIndicators: IndicatorModel.animation(width: 25, height: 10, spaceBetween: 5, widthAnimation: 60),
              height:650,
              activeColor: Colors.amberAccent,
              disableColor: Colors.white,
              animation: true,
              borderRadius: 10,
              width:600,
              indicatorBottom: false,
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        onTap: (int val){
          switch(val){
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
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_sharp, color: Colors.black,),
              label: 'Menu'
          ),
        ],
      ),
    );
  }
}
