import 'package:firebase_auth/firebase_auth.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

//  final TextEditingController _amountController = TextEditingController();



// void startPayment() {
//   PayHere.startPayment(
//     paymentObject, 
//     (paymentId) {
//       print("One Time Payment Success. Payment Id: $paymentId");
//     }, 
//     (error) { 
//       print("One Time Payment Failed. Error: $error");
//     }, 
//     () { 
//       print("One Time Payment Dismissed");
//     }
//   );
// }


import 'package:flutter/material.dart';


Map paymentObject = {
  "sandbox": true,                 // true if using Sandbox Merchant ID
  "merchant_id": "1229455",        // Replace your Merchant ID
  "merchant_secret": "MzA1MDc1OTY4NzYzNjM4MzM1ODQxMjk2NTkwNTM1MTIzNTc3ODA=",        // See step 4e
  "notify_url": "http://sample.com/notify",
  "order_id": "ItemNo12345",
  "items": "Hello from Flutter!",
  "amount": "50000.00",
  "currency": "LKR",
  "first_name": "Saman",
  "last_name": "Perera",
  "email": "samanp@gmail.com",
  "phone": "0771234567",
  "address": "No.1, Galle Road",
  "city": "Colombo",
  "country": "Sri Lanka",
  "delivery_address": "No. 46, Galle road, Kalutara South",
  "delivery_city": "Kalutara",
  "delivery_country": "Sri Lanka",
  // "custom_1": "",
  // "custom_2": ""
};  

void startPayment() {
  PayHere.startPayment(
    paymentObject, 
    (paymentId) {
      print("One Time Payment Success. Payment Id: $paymentId");
      
    }, 
    (error) { 
      print("One Time Payment Failed. Error: $error");
    }, 
    () { 
      print("One Time Payment Dismissed");
    }
  );
}



// void startPayment(String userId) {
//   PayHere.startPayment(
//     paymentObject,
//     (paymentId) async {
//       print("One Time Payment Success. Payment Id: $paymentId");

//       double paymentAmount = (paymentObject["amount"] as num).toDouble();

//       // Reference to the user's profile document
//       DocumentReference profileRef =
//           FirebaseFirestore.instance.collection("profile").doc(userId);

//       FirebaseFirestore.instance.runTransaction((transaction) async {
//         DocumentSnapshot snapshot = await transaction.get(profileRef);

//         if (snapshot.exists) {
//           double currentBalance =
//               ((snapshot.data() as Map<String, dynamic>)["balance"] as num?)?.toDouble() ?? 0.0;
//           double updatedBalance = currentBalance + paymentAmount;

//           transaction.update(profileRef, {"balance": updatedBalance});
//         }
//       });
//     },
//     (error) {
//       print("One Time Payment Failed. Error: $error");
//     },
//     () {
//       print("One Time Payment Dismissed");
//     },
//   );
// }



void onRechargeTap(BuildContext context) {
  TextEditingController amountController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Enter Amount"),
        content: TextField(
          controller: amountController,
          keyboardType: TextInputType.number, // Numeric keyboard
          decoration: InputDecoration(
            hintText: "Enter amount",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog on cancel
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              String amountText = amountController.text;
              double? amount = double.tryParse(amountText);

              if (amount == null || amount < 100) {
                // Show error message if amount is invalid
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please enter a valid amount (minimum 100)"),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                // Update amount in paymentObject
                paymentObject["amount"] = amountText;
                // User? user = FirebaseAuth.instance.currentUser;
                startPayment(); // Start payment process
                Navigator.pop(context); // Close dialog after confirmation
              }
            },
            child: Text("Confirm"),
          ),
        ],
      );
    },
  );
}

