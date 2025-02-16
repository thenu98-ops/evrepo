import 'login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/firebasemodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';





class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference profileCollection = FirebaseFirestore.instance.collection('profile');

  // Add profile with auto-generated ID
  Future<void> addProfile(Profile profile) async {
    await profileCollection.add(profile.toJson());
    print("Profile added successfully!");
  }

  // Get all profiles
  Future<List<Profile>> getAllProfiles() async {
    QuerySnapshot snapshot = await profileCollection.get();

    return snapshot.docs.map((doc) => Profile.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }


  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController confirmPasswordCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController firstNameCon = TextEditingController();
  final TextEditingController lastNameCon = TextEditingController();
  final TextEditingController mobileCon = TextEditingController();
  final TextEditingController addressCon = TextEditingController();
  final TextEditingController cityCon = TextEditingController();





  void uploadProfile() async {
    Profile profile = Profile(
      email: emailCon.text,
      firstName: firstNameCon.text,
      lastName: lastNameCon.text,
      mobile: mobileCon.text,
      address: addressCon.text,
      city: cityCon.text, 
      balance: 100, 
      energyKw: 100, 
      isCharging: false,
    );

    // await _firestoreService.addProfile(profile);
    await addProfile(profile);
    print("Profile uploaded!");
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.antiAlias,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Pro',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'Charger',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 221, 229, 236),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  'assets/reg.png',
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 200,
                height: 67,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Color(0xFF202D51),
                      fontSize: 40,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // First Name
              TextField(
                controller: firstNameCon,
                decoration: InputDecoration(
                  hintText: 'First Name',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Last Name
              TextField(
                controller: lastNameCon,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Mobile
              TextField(
                controller: mobileCon,
                decoration: InputDecoration(
                  hintText: 'Mobile',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Address
              TextField(
                controller: addressCon,
                decoration: InputDecoration(
                  hintText: 'Address',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // City
              TextField(
                controller: cityCon,
                decoration: InputDecoration(
                  hintText: 'City',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Email
              TextField(
                controller: emailCon,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password
              TextField(
                controller: passwordCon,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Confirm Password
              TextField(
                controller: confirmPasswordCon,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Terms and Conditions
              Center(
                child: SizedBox(
                  width: 258,
                  height: 49,
                  child: Text.rich(
                    TextSpan(
                      children: const [
                        TextSpan(
                          text: 'by signing up, you’re agree to',
                          style: TextStyle(
                            color: Color(0xFF7D8898),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: ' our terms and conditions',
                          style: TextStyle(
                            color: Color(0xFF3952FF),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'and',
                          style: TextStyle(
                            color: Color(0xFF7D8898),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'privacy policy',
                          style: TextStyle(
                            color: Color(0xFF3952FF),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Register Button
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (emailCon.text.isNotEmpty &&
                        passwordCon.text.length > 6 &&
                        confirmPasswordCon.text == passwordCon.text) {
                      final auth = FirebaseAuth.instance;

                      try {
                        await auth.createUserWithEmailAndPassword(
                          email: emailCon.text.trim(),
                          password: passwordCon.text.trim(),
                        );
                        uploadProfile();
                        emailCon.clear();
                        passwordCon.clear();
                        confirmPasswordCon.clear();
                        firstNameCon.clear();
                        lastNameCon.clear();
                        mobileCon.clear();
                        addressCon.clear();
                        cityCon.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registered Successfully!'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } catch (e) {
                        if (e is FirebaseAuthException) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error: ${e.message}'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('An unknown error occurred.'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please enter valid details and ensure passwords match.'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
              const SizedBox(height: 16),

              // OR Text
              Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Login Prompt
              Center(
                child: SizedBox(
                  width: 198,
                  height: 41,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Join us before?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: '  Login',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'login.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'services/firebasemodel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Register extends StatefulWidget {
//   const Register({super.key});

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final CollectionReference profileCollection =
//       FirebaseFirestore.instance.collection('profile');

//   // Add profile with auto-generated ID
//   Future<void> addProfile(Profile profile) async {
//     await profileCollection.add(profile.toJson());
//     print("Profile added successfully!");
//   }

//   // Get all profiles
//   Future<List<Profile>> getAllProfiles() async {
//     QuerySnapshot snapshot = await profileCollection.get();
//     return snapshot.docs
//         .map((doc) => Profile.fromJson(doc.data() as Map<String, dynamic>, doc.id))
//         .toList();
//   }

//   final TextEditingController passwordCon = TextEditingController();
//   final TextEditingController confirmPasswordCon = TextEditingController();
//   final TextEditingController emailCon = TextEditingController();
//   final TextEditingController firstNameCon = TextEditingController();
//   final TextEditingController lastNameCon = TextEditingController();
//   final TextEditingController mobileCon = TextEditingController();
//   final TextEditingController addressCon = TextEditingController();
//   final TextEditingController cityCon = TextEditingController();

//   void uploadProfile() async {
//     Profile profile = Profile(
//       email: emailCon.text,
//       firstName: firstNameCon.text,
//       lastName: lastNameCon.text,
//       mobile: mobileCon.text,
//       address: addressCon.text,
//       city: cityCon.text,
//       balance: 100,
//       energyKw: 100,
//       isCharging: false,
//     );

//     await addProfile(profile);
//     print("Profile uploaded!");
//   }

//   @override
//   void dispose() {
//     passwordCon.dispose();
//     confirmPasswordCon.dispose();
//     emailCon.dispose();
//     firstNameCon.dispose();
//     lastNameCon.dispose();
//     mobileCon.dispose();
//     addressCon.dispose();
//     cityCon.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         clipBehavior: Clip.antiAlias,
//         title: RichText(
//           text: const TextSpan(
//             children: [
//               TextSpan(
//                 text: 'Pro',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               TextSpan(
//                 text: 'Charger',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         backgroundColor: Color.fromARGB(255, 221, 229, 236),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//               Center(
//                 child: Image.asset(
//                   'assets/reg.png',
//                   width: 40,
//                   height: 40,
//                 ),
//               ),
//               const SizedBox(
//                 width: 200,
//                 height: 67,
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Sign up',
//                     style: TextStyle(
//                       color: Color(0xFF202D51),
//                       fontSize: 40,
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w700,
//                       height: 0,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // First Name
//               TextField(
//                 controller: firstNameCon,
//                 decoration: InputDecoration(
//                   hintText: 'First Name',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Last Name
//               TextField(
//                 controller: lastNameCon,
//                 decoration: InputDecoration(
//                   hintText: 'Last Name',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Mobile
//               TextField(
//                 controller: mobileCon,
//                 decoration: InputDecoration(
//                   hintText: 'Mobile',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Address
//               TextField(
//                 controller: addressCon,
//                 decoration: InputDecoration(
//                   hintText: 'Address',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // City
//               TextField(
//                 controller: cityCon,
//                 decoration: InputDecoration(
//                   hintText: 'City',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Email
//               TextField(
//                 controller: emailCon,
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Password
//               TextField(
//                 controller: passwordCon,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Confirm Password
//               TextField(
//                 controller: confirmPasswordCon,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Confirm Password',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Terms and Conditions
//               Center(
//                 child: SizedBox(
//                   width: 258,
//                   height: 49,
//                   child: Text.rich(
//                     TextSpan(
//                       children: const [
//                         TextSpan(
//                           text: 'by signing up, you’re agree to',
//                           style: TextStyle(
//                             color: Color(0xFF7D8898),
//                             fontSize: 12,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             height: 0,
//                           ),
//                         ),
//                         TextSpan(
//                           text: ' our terms and conditions',
//                           style: TextStyle(
//                             color: Color(0xFF3952FF),
//                             fontSize: 12,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             height: 0,
//                           ),
//                         ),
//                         TextSpan(
//                           text: ' ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             height: 0,
//                           ),
//                         ),
//                         TextSpan(
//                           text: 'and',
//                           style: TextStyle(
//                             color: Color(0xFF7D8898),
//                             fontSize: 12,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             height: 0,
//                           ),
//                         ),
//                         TextSpan(
//                           text: ' ',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             height: 0,
//                           ),
//                         ),
//                         TextSpan(
//                           text: 'privacy policy',
//                           style: TextStyle(
//                             color: Color(0xFF3952FF),
//                             fontSize: 12,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             height: 0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Register Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     if (emailCon.text.isNotEmpty &&
//                         passwordCon.text.length > 6 &&
//                         confirmPasswordCon.text == passwordCon.text) {
//                       final auth = FirebaseAuth.instance;

//                       try {
//                         await auth.createUserWithEmailAndPassword(
//                           email: emailCon.text.trim(),
//                           password: passwordCon.text.trim(),
//                         );
//                         uploadProfile();
//                         emailCon.clear();
//                         passwordCon.clear();
//                         confirmPasswordCon.clear();
//                         firstNameCon.clear();
//                         lastNameCon.clear();
//                         mobileCon.clear();
//                         addressCon.clear();
//                         cityCon.clear();

//                         if (mounted) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text('Registered Successfully!'),
//                               backgroundColor: Colors.green,
//                               duration: Duration(seconds: 3),
//                             ),
//                           );
//                         }
//                       } catch (e) {
//                         if (mounted) {
//                           if (e is FirebaseAuthException) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('Error: ${e.message}'),
//                                 backgroundColor: Colors.red,
//                                 duration: Duration(seconds: 3),
//                               ),
//                             );
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('An unknown error occurred.'),
//                                 backgroundColor: Colors.red,
//                                 duration: Duration(seconds: 3),
//                               ),
//                             );
//                           }
//                         }
//                       }
//                     } else {
//                       if (mounted) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text(
//                                 'Please enter valid details and ensure passwords match.'),
//                             backgroundColor: Colors.red,
//                             duration: Duration(seconds: 3),
//                           ),
//                         );
//                       }
//                     }
//                   },
//                   child: const Text('Register'),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // OR Text
//               Center(
//                 child: Text(
//                   'OR',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w700,
//                     height: 0,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5),

//               // Login Prompt
//               Center(
//                 child: SizedBox(
//                   width: 198,
//                   height: 41,
//                   child: Text.rich(
//                     TextSpan(
//                       children: [
//                         const TextSpan(
//                           text: 'Join us before?',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w400,
//                             height: 0,
//                           ),
//                         ),
//                         TextSpan(
//                           text: '  Login',
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const Login(),
//                                 ),
//                               );
//                             },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
