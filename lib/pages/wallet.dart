import 'package:boardzone_app/services/database.dart';
import 'package:boardzone_app/services/shared_preference.dart';
import 'package:boardzone_app/services/widget_support.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet = "0";
  String? id;
  TextEditingController amountcontroller = TextEditingController();

  getthesharedpref() async {
    wallet = await SharedpreferenceHelper().getUserWallet();
    id = await SharedpreferenceHelper().getUserId();
    setState(() {});
  }

  @override
  void initState() {
    getthesharedpref();
    super.initState();
  }

  Map<String, dynamic> paymentIntent = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wallet == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.only(top: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2.0,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Center(
                        child: Text(
                          "Wallet",
                          style: AppWidget.headlinetextstyle(22),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
                    child: Row(
                      children: [
                        Image.asset(
                          "images/wallet.png", // Ensure you have a wallet icon or remove this
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.account_balance_wallet,
                                  size: 60, color: Colors.grey),
                        ),
                        const SizedBox(width: 40.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Wallet",
                              style: AppWidget.contentstyle(16),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              "LKR $wallet",
                              style: AppWidget.headlinetextstyle(22),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Add money",
                      style: AppWidget.headlinetextstyle(20),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      amountOption("100"),
                      amountOption("500"),
                      amountOption("1000"),
                      amountOption("2000"),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      openEdit();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xFF008080),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          "Add Money",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  // Helper widget for amount buttons
  Widget amountOption(String amount) {
    return GestureDetector(
      onTap: () {
        makePayment(amount);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE9E2E2)),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "LKR $amount",
          style: AppWidget.headlinetextstyle(16),
        ),
      ),
    );
  }

  // Simulated Payment Logic
  Future<void> makePayment(String amount) async {
    try {
      int amountInt = int.parse(amount);
      int currentWalletInt = int.parse(wallet ?? "0");
      int total = currentWalletInt + amountInt;

      await DatabaseMethods().updateUserWallet(id!, total.toString());
      await SharedpreferenceHelper().saveUserWallet(total.toString());

      setState(() {
        wallet = total.toString();
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Money Added Successfully!")));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> openEdit() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.cancel)),
                    const SizedBox(width: 60.0),
                    const Text(
                      "Add Money",
                      style: TextStyle(
                          color: Color(0xFF008080),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Text("Amount"),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 2.0),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: amountcontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Enter Amount'),
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    makePayment(amountcontroller.text);
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF008080),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Text(
                      "Pay",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}