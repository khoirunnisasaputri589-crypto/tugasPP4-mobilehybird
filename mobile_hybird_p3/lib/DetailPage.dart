import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map coffee;
  DetailPage({required this.coffee});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String size = 'M';

  @override
  Widget build(BuildContext context) {
    var coffee = widget.coffee;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(coffee['image'], height: 250, fit: BoxFit.cover),
              Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coffee['name'],
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(coffee['desc']),
                SizedBox(height: 10),
                Text("Description"),
                Text(
                    "A cappuccino is an approximately 150 ml beverage with espresso and milk."),
                SizedBox(height: 10),
                Row(
                  children: [
                    sizeBtn('S'),
                    sizeBtn('M'),
                    sizeBtn('L'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${coffee['price']}"),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Buy Now"),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget sizeBtn(String s) {
    return GestureDetector(
      onTap: () {
        setState(() => size = s);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: size == s ? Colors.orange : Colors.grey),
        ),
        child: Text(s),
      ),
    );
  }
}
