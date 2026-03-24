import 'package:flutter/material.dart';
import 'DetailPage.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> coffees = [
    {
      'name': 'Cappucino',
      'desc': 'with Chocolate',
      'price': 4.53,
      'rating': 4.8,
      'image': 'assets/capucino-withcoklat2.jpeg'
    },
    {
      'name': 'Cappucino',
      'desc': 'with Oat Milk',
      'price': 3.90,
      'rating': 4.9,
      'image': 'assets/capucino-oatmilk2.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location", style: TextStyle(color: Colors.grey)),
                      Text("West, Balurghat",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  )
                ],
              ),
            ),

            // SEARCH
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search coffee",
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
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
            ),

            SizedBox(height: 10),

            // GRID
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: coffees.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final coffee = coffees[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(coffee: coffee),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.asset(coffee['image'], height: 100),
                          Text(coffee['name']),
                          Text("\$${coffee['price']}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
