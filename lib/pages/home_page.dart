import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        title: Text('Cars', style: TextStyle(color: Colors.red, fontSize: 25),),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none, color: Colors.red,), onPressed: null),
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.red,), onPressed: null),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // #catigories
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoriesItems(selected: true, title: 'All'),
                  categoriesItems(selected: false, title: 'Red'),
                  categoriesItems(selected: false, title: 'Blue'),
                  categoriesItems(selected: false, title: 'Green'),
                  categoriesItems(selected: false, title: 'Yellow'),
                ],
              ),
            ),
            SizedBox(height: 20,),

            //makeItem
            makeItem('assets/images/im_car1.jpg'),
            makeItem('assets/images/im_car5.jpg'),
            makeItem('assets/images/im_car3.jpg'),
            makeItem('assets/images/im_car4.png'),
            makeItem('assets/images/im_car2.jpg'),
          ],
        ),
      ),
    );
  }

  Widget categoriesItems({bool selected, String title}) {
    return AspectRatio(
      aspectRatio: 2.2 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected ? Colors.red : Colors.white,
        ),
        child: Center(
          child: Text(title, style: TextStyle(
            fontSize: selected ? 20: 17,
            color: selected ? Colors.white : Colors.black,
          ),),
        ),
      ),
    );
  }

  Widget makeItem(String image) {
    return Container(
      height: 250,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(0, 10),
            blurRadius: 20,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('PDP Car', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                SizedBox(width: 10,),
                Text('Electric', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('100\$', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border, color: Colors.white, size: 20,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
