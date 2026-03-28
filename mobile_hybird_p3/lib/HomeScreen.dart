import 'package:flutter/material.dart';
import 'DetailPage.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> coffees = [
    {
      "name": "Cappuccino",
      "desc": "with Chocolate",
      "price": 4.53,
      "rating": 4.8,
      "image": "assets/capucino-withcoklat2.jpeg"
    },
    {
      "name": "Cappuccino",
      "desc": "with Oat Milk",
      "price": 3.90,
      "rating": 4.9,
      "image": "assets/capucino-oatmilk2.jpeg"
    },
    {
      "name": "Cappuccino",
      "desc": "with Chocolate",
      "price": 4.53,
      "rating": 4.5,
      "image": "assets/capucino-withcoklat.jpeg"
    },
    {
      "name": "Cappuccino",
      "desc": "with Oat Milk",
      "price": 3.90,
      "rating": 4.0,
      "image": "assets/capucino-oatmilk.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            header(),
            searchBar(),
            categoryTabs(),
            Expanded(child: coffeeGrid(context)),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Location",
                style: TextStyle(color: Colors.white70, fontSize: 12)),
            Text("West, Balurghat",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ]),
          CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search coffee",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 10), // 🔥 lebih rapat
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.tune, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget categoryTabs() {
    final categories = ["Cappuccino", "Macchiato", "Latte", "Americano"];

    return Container(
      height: 36,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: index == 0 ? Colors.orange : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 13,
                color: index == 0 ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget coffeeGrid(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12),
      itemCount: coffees.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.65, // 🔥 proporsi lebih pas
      ),
      itemBuilder: (context, index) {
        final coffee = coffees[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(coffee: coffee),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(12), // 🔥 lebih kecil
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 🔥 penting biar tidak renggang
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180, // 🔥 tidak terlalu besar tapi tetap jelas
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          coffee["image"],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.yellow, size: 10),
                              SizedBox(width: 2),
                              Text(
                                "${coffee["rating"]}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  coffee["name"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  coffee["desc"],
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                  maxLines: 1,
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${coffee["price"]}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.add,
                          color: Colors.white, size: 16),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}