import 'package:flutter/material.dart';
import 'package:boardzone_app/services/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
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
                  decoration: BoxDecoration(color: const Color.fromARGB(87, 0, 0, 0), borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      SizedBox(height: 30.0,),
                      Container (
                        margin : const EdgeInsets.only(top:50.0, left: 10.0),
                          child: Text(
                            "Helping students feel at home while studying away from home",
                            style: AppWidget.whitetextstyle(24.0),
                            ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                        margin: EdgeInsets.only(right:20.0, left: 20.0, top: 60.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(83, 255, 255, 255),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,prefixIcon: Icon(Icons.search, color: Colors.white,),
                            hintText: "Search for accomodation",
                            hintStyle: AppWidget.whitetextstyle(20.0),
                          ),
                        ),
                      ),
                    ]
                  ),
                )
              ],
            ),
          ],
        ),
      ), // Container
    ); // Scaffold
  }
}