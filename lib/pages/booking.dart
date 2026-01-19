import 'package:boardzone_app/services/database.dart';
import 'package:boardzone_app/services/shared_preference.dart';
import 'package:boardzone_app/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Stream? bookingStream;
  String? id;

  getontheload() async {
    id = await SharedpreferenceHelper().getUserId();
    // We pass the ID to get only this user's bookings
    if (id != null) {
      bookingStream = await DatabaseMethods().getUserBookings(id!);
      setState(() {});
    }
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "My Bookings",
                    style: AppWidget.headlinetextstyle(22),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: StreamBuilder(
                stream: bookingStream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.docs[index];
                        
                        // 🔹 FIX START: Convert to Map to handle missing keys safely
                        Map<String, dynamic>? data = ds.data() as Map<String, dynamic>?;
                        
                        // Use the map 'data' instead of 'ds'
                        // If 'data' is null, these default to empty strings
                        String serviceName = data?["Service"] ?? "Boarding Place";
                        String fee = data?["Total"] ?? "0";
                        // 🔹 FIX END

                        return Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 20.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.home,
                                        size: 40, color: Colors.blue),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        serviceName, // Updated variable
                                        style: AppWidget.headlinetextstyle(18),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        "Fee: " + fee, // Updated variable
                                        style: AppWidget.contentstyle(16),
                                      ),
                                      const SizedBox(height: 5.0),
                                      const Text(
                                        "Status: Booked",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}