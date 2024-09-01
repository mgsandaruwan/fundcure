import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funcure1/component/projectcomponent.dart';
import 'package:funcure1/page/profilescreen.dart';
import 'DetailsScreen.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> _profileStream;

  @override
  void initState() {
    super.initState();
    _profileStream = _firestore.collection('profile').snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: _profileStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text('No data available');
            }

            final profileData = snapshot.data!.docs.first.data() as Map<String, dynamic>;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Name: ${profileData['fName'] ?? 'N/A'}'),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email: ${profileData['email'] ?? 'N/A'}'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Contact: ${profileData['contact'] ?? 'N/A'}'),
                ),
                ListTile(
                  leading: Icon(Icons.date_range),
                  title: Text('Birth Date: ${profileData['date'] ?? 'N/A'}'),
                ),
                Divider(),
                Text(
                  'Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Address: ${profileData['address'] ?? 'N/A'}'),
                ),
                ListTile(
                  leading: Icon(Icons.fingerprint),
                  title: Text('Bio : ${profileData['bio'] ?? 'N/A'}'),
                ),
              ],
            );
          },
        )
      ),
    );
  }
}