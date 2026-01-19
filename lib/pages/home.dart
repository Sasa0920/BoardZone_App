import 'package:flutter/material.dart';
import 'package:boardzone_app/services/widget_support.dart';
import 'package:boardzone_app/services/database.dart';
import 'detail_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? boardingStream;

  getontheload() async {
    boardingStream = await DatabaseMethods().getallBoardings();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(245, 243, 240, 240),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 HEADER (UNCHANGED)
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image.asset(
                    "images/home.png",
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(87, 0, 0, 0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Helping students feel at home while studying away from home",
                          style: AppWidget.whitetextstyle(24),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(83, 255, 255, 255),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.search, color: Colors.white),
                            hintText: "Search for accommodation",
                            hintStyle: AppWidget.whitetextstyle(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "The most relevant",
                style: AppWidget.headlinetextstyle(22),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 MOST RELEVANT (NAVIGATION ADDED, UI SAME)
            SizedBox(
              height: 270,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [

                  _houseCard(
                    context,
                    image: "images/house1.jpg",
                    name: "Sarasavi Asapuwa",
                    price: "LKR 25,000",
                    people: "3",
                    phone: "077 123 4567",
                    location: "Near Faculty of Engineering, University of Ruhuna",
                  ),

                  _houseCard(
                    context,
                    image: "images/house2.jpeg",
                    name: "Ranawiru Mawatha",
                    price: "LKR 45,000",
                    people: "7",
                    phone: "071 222 3344",
                    location: "Hapugala, Galle",
                  ),

                  _houseCard(
                    context,
                    image: "images/house3.png",
                    name: "Sarasavi Uyana",
                    price: "LKR 30,000",
                    people: "4",
                    phone: "075 888 9999",
                    location: "Karapitiya",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 TOP RATED (UNCHANGED)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Top rated houses",
                style: AppWidget.headlinetextstyle(22),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height: 201,
              margin: const EdgeInsets.only(left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _topRated("images/rate1.jpg", "Darlington Rd", "4.9"),
                  _topRated("images/rate2.jpg", "Hapugala", "4.8"),
                  _topRated("images/rate3.jpg", "Ape gama", "4.8"),
                  _topRated("images/rate4.jpeg", "Ranawiru Rd", "4.6"),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// 🔹 HOUSE CARD (SAME UI + NAVIGATION)
  Widget _houseCard(
    BuildContext context, {
    required String image,
    required String name,
    required String price,
    required String people,
    required String phone,
    required String location,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              image: image,
              name: name,
              price: price,
              phone: phone,
              location: location,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 10),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    image,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16, color: Colors.red),
                          Expanded(
                            child: Text(
                              name,
                              style: AppWidget.contentstyle(15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(price, style: AppWidget.headlinetextstyle(15)),
                          const Spacer(),
                          const Icon(Icons.person, size: 16),
                          Text(people, style: AppWidget.contentstyle(13)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 TOP RATED CARD (UNCHANGED)
  Widget _topRated(String image, String place, String rating) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                height: 160,
                width: 162,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                Text(place, style: AppWidget.contentstyle(15)),
                const SizedBox(width: 10),
                const Icon(Icons.star, size: 15, color: Colors.amber),
                Text(rating, style: AppWidget.contentstyle(11)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
