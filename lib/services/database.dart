import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  // 1. Add User Info (for SignUp)
  Future addUserInfo(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  // 2. Add Boarding Info (for Owner)
  Future addBoarding(Map<String, dynamic> boardingInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Boarding")
        .doc(id)
        .set(boardingInfoMap);
  }

  // 3. Get All Boardings (for Home Page)
  Future<Stream<QuerySnapshot>> getallBoardings() async {
    return await FirebaseFirestore.instance.collection("Boarding").snapshots();
  }

  // ---------------------------------------------------------
  // 🔹 NEW METHODS ADDED FOR WALLET AND BOOKING 🔹
  // ---------------------------------------------------------

  // 4. Update User Wallet (for Wallet Page & Booking Logic)
  Future updateUserWallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"Wallet": amount});
  }

  // 5. Add Booking (for Detail Page)
  Future addBooking(Map<String, dynamic> bookingInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("bookings")
        .add(bookingInfoMap);
  }

  // 6. Get User Bookings (for Booking Page)
  Future<Stream<QuerySnapshot>> getUserBookings(String id) async {
    return await FirebaseFirestore.instance
        .collection("bookings")
        .where("UserId", isEqualTo: id)
        .snapshots();
  }
}