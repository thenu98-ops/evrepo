import 'package:flutter/material.dart';
import '../services/payhere_service.dart';

class EWalletScreen extends StatefulWidget {
  const EWalletScreen({super.key});

  @override
  State<EWalletScreen> createState() => _EWalletScreenState();
}

class _EWalletScreenState extends State<EWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('E-Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: BorderSide.strokeAlignCenter),
            Center(
              child: Image.asset('assets/ewallet.png', width: 200, height: 200),
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 38,
                child: Text(
                  'Your Balance',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 350,
                height: 150,
                decoration: ShapeDecoration(
                  color: Color(0x3DAEEDE6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(37),
                  ),
                ),

        child: Center(
    child: Text(
      "LKR"+ " " +paymentObject["amount"], // Display the updated amount here
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  ),

              ),
            ),
            SizedBox(height: 20),

            // Buttons Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Recharge Button
                  InkWell(
                    onTap: () {
                      print('Recharge Button Pressed');



                onRechargeTap(context);





                    },
                    child: Container(
                      width: 121,
                      height: 43,
                      decoration: ShapeDecoration(
                        color: Color(0x7000A1E4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Recharge',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Transaction Button
                  InkWell(
                    onTap: () {
                      print('Transaction Button Pressed');
                    },
                    child: Container(
                      width: 121,
                      height: 43,
                      decoration: ShapeDecoration(
                        color: Color(0x7702F0A4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Transaction',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container (End of Buttons Section)
          ],
        ),
      ),
    );
  }
}