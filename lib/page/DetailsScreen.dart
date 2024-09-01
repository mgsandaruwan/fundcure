import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funcure1/CreditCard.dart';
import 'package:funcure1/constants/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsScreen> {
  late String currentUserUid;
  String? imageUrl;
  @override
  void initState() {
    super.initState();
    fetchUserUid(); // Fetch the user's image on screen initialization
  }
  Future<void> fetchUserUid() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        setState(() {
          currentUserUid = user.uid; // Set the current user's UID
        });
        fetchImage(); // Fetch the user's image after getting the UID
      }
    } catch (e) {
      print('Error fetching user UID: $e');
    }
  }

  Future<void> fetchImage() async {
    try {
      if (currentUserUid != null) {
        final String imagePath = 'Campaign/$currentUserUid/'; // Replace with your path structure
        final ref = FirebaseStorage.instance.ref().child(imagePath);

        final url = await ref.listAll().then((value) async {
          if (value.items.isNotEmpty) {
            return await value.items.first.getDownloadURL();
          }
        });

        if (url != null) {
          setState(() {
            imageUrl = url; // Set the retrieved image URL to the state variable
          });
        }
      }
    } catch (e) {
      print('Error fetching image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Donation Details',
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 4,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.navigate_before,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              imageUrl != null
                  ? Image.network(
                imageUrl!,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )
                  : Placeholder(
                fallbackHeight: MediaQuery.of(context).size.height * 0.3,
                color: Colors.grey.withOpacity(0.3),
              ),
              SizedBox(height: 20),

              // Total Donation section
              Text(
                'Total Donation: \$500.00', // Replace with actual total donation amount
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Percentage Ribbon
              Stack(
                children: [
                  Container(
                    height: 10,
                    width: screenWidth * 0.8, // Adjust width as needed
                    color: Colors.grey[300],
                  ),
                  Container(
                    height: 10,
                    width: screenWidth * 0.01, // Adjust width as needed
                    color: Colors.greenAccent,
                  ),
                ],
              ),
              SizedBox(height: 5),

              // Target section
              Text(
                'Target:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),

              // Description section
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', // Replace with actual description
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 130),

              // Make Payment button
              Center(
                child: SizedBox(
                  width: screenWidth * 0.6, // Adjust button width as needed
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  creditCard()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF1CBF72),
                    ),
                    child: Text(
                      'Make Payment',
                      style: TextStyle(fontSize: 22,color:Color(0xFFFFFFFF)), // Adjust button text size
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
