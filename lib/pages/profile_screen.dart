import 'package:ev/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev/services/firebasemodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Profile? userProfile;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

Future<void> fetchUserProfile() async {
  String? userEmail = _auth.currentUser?.email;

  if (userEmail == null) return; // Ensure user is logged in

  QuerySnapshot query = await _firestore
      .collection('profile')
      .where('email', isEqualTo: userEmail)
      .limit(1)
      .get();

  if (query.docs.isNotEmpty && mounted) {  // ✅ Check if widget is still in tree
    setState(() {
      userProfile = Profile.fromJson(
          query.docs.first.data() as Map<String, dynamic>,
          query.docs.first.id);
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: userProfile == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${userProfile!.firstName} ${userProfile!.lastName}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Email: ${userProfile!.email}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Mobile: ${userProfile!.mobile}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Address: ${userProfile!.address}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('City: ${userProfile!.city}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  ElevatedButton(onPressed: (){
                    _auth.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login())); 
                  }, child: Text('Logout'))
                ],
                
              ),
            ),
    );
  }
}
