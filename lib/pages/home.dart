import 'package:flutter/material.dart';
import 'package:boardzone_app/services/widget_support.dart';
import 'package:boardzone_app/services/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? boardingStream;

      getontheload()async{
      boardingStream=await DatabaseMethods().getallBoardings();
      setState(() {
        
      });
    }
    @override
    void initState(){
      super.initState();
      getontheload();

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(245, 243, 240, 240),
      body: SingleChildScrollView(
        child: Container(
          
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
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
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("The most relavent", style: AppWidget.headlinetextstyle(22.0)),
              ),
              SizedBox(height: 20.0,),
              Container(
                height: 270,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right:10.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0,2),
                            ),
                          ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              child: Image.asset("images/house1.jpg", width: 200, height: 200,fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.location_on, size: 16.0, color: Colors.red,),
                                        Text("Sarasavi Asapuwa", style: AppWidget.contentstyle(15.0), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                        SizedBox(height: 4.0),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(" LKR 25,000", style: AppWidget.headlinetextstyle(15.0),),
                                        SizedBox(height: 6.0),
                                        SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                                        Icon(Icons.person, size: 16.0, color: Colors.black,),
                                        Text("3", style: AppWidget.contentstyle(13.0),),
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
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right:10.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0,2),
                            ),
                          ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              child: Image.asset("images/house2.jpeg", width: 200, height: 200,fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.location_on, size: 16.0, color: Colors.red,),
                                        Text("Ranawiru mawatha", style: AppWidget.contentstyle(15.0), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                        SizedBox(height: 4.0),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(" LKR 45,000", style: AppWidget.headlinetextstyle(15.0),),
                                        SizedBox(height: 6.0),
                                        SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                                        Icon(Icons.person, size: 16.0, color: Colors.black,),
                                        Text("7", style: AppWidget.contentstyle(13.0),),
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
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right:10.0),
                      child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0,2),
                            ),
                          ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              child: Image.asset("images/house3.png", width: 200, height: 200,fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.location_on, size: 16.0, color: Colors.red,),
                                        Text("Sarasavi Uyana", style: AppWidget.contentstyle(15.0), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                        SizedBox(height: 4.0),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(" LKR 30,000", style: AppWidget.headlinetextstyle(15.0),),
                                        SizedBox(height: 6.0),
                                        SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                                        Icon(Icons.person, size: 16.0, color: Colors.black,),
                                        Text("4", style: AppWidget.contentstyle(13.0),),
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
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Text("Top rated houses", style: AppWidget.headlinetextstyle(22.0)),
              ),
              SizedBox(height: 20.0,),
              Container(
                margin: EdgeInsets.only(left: 20.0, bottom: 5.0),
                height: 201,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                  Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0),),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            "images/rate1.jpg",
                            height: 160, 
                            width: 162, 
                            fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 0.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0, right: 10.0, bottom: 20.0, top: 0.0),
                            child: Row(
                              children: [
                                Icon(Icons.location_on, size: 16.0, color: Colors.black,),
                                Text("Darlington Rd", style: AppWidget.contentstyle(15.0),),
                                SizedBox(width: 12.0),
                                Icon(Icons.star, size: 15.0, color: Colors.amber,),
                                Text("4.9", style: AppWidget.contentstyle(11.0),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0,),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "images/rate2.jpg",
                              height: 160, 
                              width: 162, 
                              fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 0.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0, right: 10.0, bottom: 20.0, top: 0.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, size: 16.0, color: Colors.black,),
                                  Text("Hapugala", style: AppWidget.contentstyle(15.0),),
                                  SizedBox(width: 12.0),
                                  Icon(Icons.star, size: 15.0, color: Colors.amber,),
                                  Text("4.8", style: AppWidget.contentstyle(11.0),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0,),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "images/rate3.jpg",
                              height: 160, 
                              width: 162, 
                              fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 0.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0, right: 10.0, bottom: 20.0, top: 0.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, size: 16.0, color: Colors.black,),
                                  Text("Ape gama", style: AppWidget.contentstyle(15.0),),
                                  SizedBox(width: 12.0),
                                  Icon(Icons.star, size: 15.0, color: Colors.amber,),
                                  Text("4.8", style: AppWidget.contentstyle(11.0),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0,),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "images/rate4.jpeg",
                              height: 160, 
                              width: 162, 
                              fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 0.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0, right: 10.0, bottom: 20.0, top: 0.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, size: 16.0, color: Colors.black,),
                                  Text("Ranawiru Rd", style: AppWidget.contentstyle(15.0),),
                                  SizedBox(width: 12.0),
                                  Icon(Icons.star, size: 15.0, color: Colors.amber,),
                                  Text("4.6", style: AppWidget.contentstyle(11.0),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],),
              ),
              SizedBox(height: 5.0,),
            ],
          ),
        ),
      ), // Container
    ); // Scaffold
  }
}