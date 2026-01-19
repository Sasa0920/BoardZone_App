import 'package:flutter/material.dart';
import 'package:boardzone_app/services/database.dart';
import 'package:boardzone_app/services/shared_preference.dart';
import 'package:boardzone_app/services/widget_support.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String phone;
  final String location;

  const DetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.phone,
    required this.location,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header Image with Back Button ---
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    /// --- Boarding Name ---
                    Text(
                      widget.name,
                      style: AppWidget.headlinetextstyle(27),
                    ),

                    const Divider(thickness: 2),

                    /// --- Facilities Section ---
                    Text("Rooms and facilities",
                        style: AppWidget.headlinetextstyle(22)),

                    _offerRow(Icons.ac_unit, "AC"),
                    _offerRow(Icons.kitchen, "Kitchen"),
                    _offerRow(Icons.bathtub, "Bathroom"),
                    _offerRow(Icons.bed, "Bedroom"),

                    const Divider(thickness: 2),

                    /// --- Description ---
                    Text("About this place",
                        style: AppWidget.headlinetextstyle(22)),

                    Text(
                      "This boarding place is ideal for faculty students, offering a safe and quiet environment.",
                      style: AppWidget.contentstyle(14),
                    ),

                    const SizedBox(height: 20),

                    /// --- Price & Contact Info Box ---
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.price,
                                style: AppWidget.headlinetextstyle(18)),
                            const Divider(),
                            Text("Contact & Location",
                                style: AppWidget.headlinetextstyle(18)),

                            Row(
                              children: [
                                const Icon(Icons.phone, color: Colors.blue),
                                const SizedBox(width: 10),
                                Text(widget.phone,
                                    style: AppWidget.contentstyle(16)),
                              ],
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.blue),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(widget.location,
                                      style: AppWidget.contentstyle(16)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// --- Book Now Button ---
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () async {
                          // 1. Get User ID & Wallet Balance
                          String? id = await SharedpreferenceHelper().getUserId();
                          String? wallet = await SharedpreferenceHelper().getUserWallet();

                          if (id == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please login to book")));
                            return;
                          }

                          // 2. Parse Price (Remove "LKR", commas, spaces)
                          // Example: "LKR 25,000" -> "25000"
                          int currentBalance = int.parse(wallet ?? "0");
                          String cleanPrice = widget.price.replaceAll(RegExp(r'[^0-9]'), '');
                          int roomPrice = int.parse(cleanPrice);

                          // 3. Transaction Logic
                          if (currentBalance >= roomPrice) {
                            // Deduct Amount
                            int newBalance = currentBalance - roomPrice;

                            // Update Wallet in Firebase & Local Storage
                            await DatabaseMethods().updateUserWallet(id, newBalance.toString());
                            await SharedpreferenceHelper().saveUserWallet(newBalance.toString());

                            // Create Booking Data
                            Map<String, dynamic> bookingInfoMap = {
                              "Service": widget.name,
                              "Total": widget.price,
                              "UserId": id,
                              "Status": "Booked",
                              "Time": DateTime.now().toString(),
                              "Location": widget.location,
                              // "Image": widget.image // Uncomment if you want to save image path
                            };

                            // Add to 'bookings' collection
                            await DatabaseMethods().addBooking(bookingInfoMap);

                            // Success Message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Booking Successful! Check 'My Bookings'."),
                              ),
                            );
                          } else {
                            // Insufficient Funds Message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Insufficient Balance! Please top up your wallet."),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0766B3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Book Now",
                          style: TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _offerRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0766B3), size: 28),
          const SizedBox(width: 10),
          Text(text, style: AppWidget.contentstyle(20)),
        ],
      ),
    );
  }
}