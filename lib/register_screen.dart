import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:funcure1/next_screen.dart';
import 'package:funcure1/business_screen.dart';
import 'package:funcure1/clarity_screen.dart';
import 'package:funcure1/medical_screen.dart';
import 'package:funcure1/welcome_screen.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedCategory = ''; // Store the selected categoryhe selected category
  String? selectedDuration; // Hold the selected duration
  File? _selectedImage;
  final picker = ImagePicker();

  final TextEditingController _campaignNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _fundraisingGoalController = TextEditingController();

  Future<void> _getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _saveToFirestore(String userUID) async {
    final CollectionReference campaigns =
    FirebaseFirestore.instance.collection('Campaign');

    try {
      await campaigns.doc(userUID).set({
        'campaign':_campaignNameController.text,
        'description': _descriptionController.text,
        'fundraisingGoal': _fundraisingGoalController.text,
        'category': selectedCategory,
        'duration':selectedDuration,
        // Add other fields as needed
      });

      if (_selectedImage != null) {
        final imageFileName = 'Campaign/$userUID/${DateTime.now().millisecondsSinceEpoch}.png';
        await campaigns.doc(userUID).update({
          'image': imageFileName,
        });
        await FirebaseStorage.instance.ref(imageFileName).putFile(_selectedImage!);
      }

      print('Data saved to Firestore.');
    } catch (e) {
      print('Error saving data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.greenAccent,
        ),
      ),

      body: SafeArea(

        // child: SingleChildScrollView (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  "Hello! Start with your Campaign!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),



            const SizedBox(height: 10),
            //username
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8F9),
                  border: Border.all(
                    color: const Color(0xFFE8ECF4),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: TextFormField(
                    controller: _campaignNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Campaign Name',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),




           const SizedBox(height: 10),
            Padding(
           padding: const EdgeInsets.symmetric(
           horizontal: 20,
           ),
             child: Container(
             width: double.infinity, // To make the container full width
             height: 120.0, // Double the container height
             decoration: BoxDecoration(
             color: const Color(0xFFF7F8F9),
      border: Border.all(
        color: const Color(0xFFE8ECF4),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: _descriptionController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'A Description about the Campaign',
          hintStyle: TextStyle(
            color: Color(0xFF8391A1),
          ),
        ),
      ),
    ),
  ),
),




            const SizedBox(height: 10),
            //Fund Raising Goal
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8F9),
                  border: Border.all(
                    color: const Color(0xFFE8ECF4),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: TextFormField(
                    controller: _fundraisingGoalController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Fund Raising Goal',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),




           const SizedBox(height: 10),
           //Camping Duration Box
Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 20,
  ),
  child: Container(
    decoration: BoxDecoration(
      color: const Color(0xFFF7F8F9),
      border: Border.all(
        color: const Color(0xFFE8ECF4),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: DropdownButtonFormField<String>(
        value: selectedDuration,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Campaign Duration',
          hintStyle: TextStyle(
            color: Color(0xFF8391A1),
          ),
        ),
        items: const [
          DropdownMenuItem<String>(
            value: '1 Year',
            child: Text('1 Year'),
          ),
          DropdownMenuItem<String>(
            value: '2 Years',
            child: Text('2 Years'),
          ),
          DropdownMenuItem<String>(
            value: '3 Years',
            child: Text('3 Years'),
          ),
          DropdownMenuItem<String>(
            value: 'Category 4',
            child: Text('Others'),
          ),
          // Add more duration options as needed
        ],
        onChanged: (value) {
          setState(() {
            selectedDuration = value; // Update the selected duration
          });
          },
      ),
    ),
  ),
),


          const SizedBox(height: 10),
          //Campaign Category Dropdown
Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 20,
  ),
  child: Container(
    decoration: BoxDecoration(
      color: const Color(0xFFF7F8F9),
      border: Border.all(
        color: const Color(0xFFE8ECF4),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Category',
          hintStyle: TextStyle(
            color: Color(0xFF8391A1),
          ),
        ),
        items: const [
          DropdownMenuItem<String>(
            value: 'Medical Expenses',
            child: Text('Medical Expenses'),
          ),
          DropdownMenuItem<String>(
            value: 'Clarity Services',
            child: Text('Clarity Services'),
          ),
          DropdownMenuItem<String>(
            value: 'Business',
            child: Text('Business'),
          ),
          // Add more categories as needed
        ],
     // Inside the Category Dropdown
onChanged: (value) {
  setState(() {
    selectedCategory = value;
  });
},

      ),
    ),
  ),
),

            const SizedBox(height: 15),
            // Image selection button
            ElevatedButton(
              onPressed: _getImage,
              child: const Text('Select Image'),
            ),

            //Continue button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: const Color(0xFF19B96A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                          onPressed: () {
                            User? user = FirebaseAuth.instance.currentUser;
                            if (user != null) {
                              _saveToFirestore(user.uid);
                            }
                            // ... navigate based on selected category ...
                        if (selectedCategory == 'Medical Expenses') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MedicalScreen()),
                          );

                        }
                        else if (selectedCategory == 'Clarity Services') {
                        Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => const ClarityScreen()),
                      );
                        }

                        else if (selectedCategory == 'Business') {
                        Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => const BusScreen()),
                      );
                        }


                        else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const  NextScreen()),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have a Campaign? ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFF35C2C1),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      //  ),
      ),
    );
  }
}
