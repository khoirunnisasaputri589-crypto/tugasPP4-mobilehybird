import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> coffee;

  const DetailPage({Key? key, required this.coffee}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  String size = "M";

  @override
  Widget build(BuildContext context) {

    final coffee = widget.coffee;

    return Scaffold(
      body: Column(
        children: [

          /// IMAGE
          Stack(
            children: [
              Image.asset(
                coffee["image"],
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,color: Colors.white),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),

          /// CONTENT
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// NAME + RATING
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coffee["name"],
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          Text(
                            coffee["desc"],
                            style: const TextStyle(
                                color: Colors.grey
                            ),
                          )
                        ],
                      ),

                      Row(
                        children: const [
                          Icon(Icons.star,color: Colors.orange),
                          SizedBox(width: 5),
                          Text("4.5"),
                          Text("(2,330)")
                        ],
                      )

                    ],
                  ),

                  const Divider(height: 30),

                  /// DESCRIPTION
                  const Text(
                    "Description",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "A cappuccino is an approximately 150 ml (5 oz) beverage, "
                    "with 25 ml of espresso coffee and 85 ml of fresh milk.",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  /// SIZE
                  const Text(
                    "Size",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      sizeBtn("S"),
                      sizeBtn("M"),
                      sizeBtn("L"),
                    ],
                  ),

                  const Spacer(),

                  /// PRICE + BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Price",style: TextStyle(color: Colors.grey)),
                          Text(
                            "\$${coffee["price"]}",
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange
                            ),
                          )
                        ],
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        onPressed: (){},
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(fontSize: 16),
                        ),
                      )

                    ],
                  )

                ],
              ),
            ),
          )

        ],
      ),
    );
  }


  /// SIZE BUTTON
  Widget sizeBtn(String s){

    return GestureDetector(
      onTap: (){
        setState(() {
          size = s;
        });
      },

      child: Container(
        margin: const EdgeInsets.only(right:10),
        padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10
        ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: size == s ? Colors.orange : Colors.grey
          ),
        ),

        child: Text(
          s,
          style: TextStyle(
              color: size == s ? Colors.orange : Colors.black
          ),
        ),
      ),
    );

  }
}