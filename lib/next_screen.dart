import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:login_signup_flow_app/screens/login_screen.dart';
import 'package:funcure1/welcome_screen.dart';
import 'package:funcure1/payment_screen.dart';
// import 'package:login_signup_flow_app/screens/medical_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  late String currentUserUid;
  File? image1;
  File? image2;
  final picker = ImagePicker();

final TextEditingController _campaignMedia = TextEditingController();
final TextEditingController _permanentAddress = TextEditingController();
final TextEditingController _district = TextEditingController();
final TextEditingController _nearestCity = TextEditingController();
final TextEditingController _gramaNiladhariDivision = TextEditingController();

  Future<void> pickImage(int imageIndex) async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        if (imageIndex == 1) {
          image1 = File(pickedImage.path);
        } else if (imageIndex == 2) {
          image2 = File(pickedImage.path);
        }
      });
    }
  }

  Future<void> uploadImageToStorage(String imagePath, File? imageFile) async {
    if (imageFile != null) {
      try {
        final ref = FirebaseStorage.instance.ref().child(imagePath);
        await ref.putFile(imageFile);
        print('Image uploaded to Firebase Storage: $imagePath');
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

Future<void> _createSubcollections(String userUID) async {
  try {
    List<String> imageUrls = [];

    // Upload images to Firebase Storage and get download URLs
    if (image1 != null) {
      String imageUrl1 = await _uploadImageAndGetUrl('image1.jpg', image1!);
      imageUrls.add(imageUrl1);
    }
    if (image2 != null) {
      String imageUrl2 = await _uploadImageAndGetUrl('image2.jpg', image2!);
      imageUrls.add(imageUrl2);
    }
    // Store data in the Payment subcollection
    await FirebaseFirestore.instance
        .collection('Campaign')
        .doc(userUID)
        .collection('MedicalExpenses')
        .doc(userUID)
        .collection('Payment')
        .doc(userUID) // Use userUID as document ID for Payment subcollection
        .set({
      'userUID': userUID,
      'campaignMedia': _campaignMedia.text,
      'permanentAddress': _permanentAddress.text,
      'district': _district.text,
      'nearestCity': _nearestCity.text,
      'gramaNiladhariDivision': _gramaNiladhariDivision.text,
      'imageUrls': imageUrls,
      // Add other payment-related data
    });

    // Navigate to PaymentScreen after creating subcollections
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const PaymentScreen()),
    // );
  } catch (e) {
    // Handle errors here
    print('Error creating subcollections: $e');
  }
}
  Future<String> _uploadImageAndGetUrl(String imagePath, File imageFile) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(imagePath);
      await ref.putFile(imageFile);
      String downloadURL = await ref.getDownloadURL();
      print('Image uploaded to Firebase Storage: $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
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

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  "Continue Creating the Campaign!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),



            const SizedBox(height: 10),
            //username
            const SizedBox(height: 15),
            //email
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
                    controller: _permanentAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Permananet Address',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),





            const SizedBox(height: 15),
            //password
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
                    controller: _district,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'District',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),




            const SizedBox(height: 15),
            //confirm password
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
                    controller: _nearestCity,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Nearest City',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),



          const SizedBox(height: 15),
            //grama niladari devision
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
                    controller: _gramaNiladhariDivision,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Grama Niladhari Division ',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Select Images:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => pickImage(1),
                        child: Text('Image 1'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => pickImage(2),
                        child: Text('Image 2'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (image1 != null || image2 != null)
                    Row(
                      children: [
                        if (image1 != null)
                          Image.file(
                            image1!,
                            width: 100, // Adjust the width of the image
                            height: 100, // Adjust the height of the image
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                        if (image2 != null)
                          Image.file(
                            image2!,
                            width: 100, // Adjust the width of the image
                            height: 100, // Adjust the height of the image
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                      ],
                    ),
                ],
              ),
            ),



            
             
            const SizedBox(height: 15),
            //register button
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
                          _createSubcollections(user.uid);
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PaymentScreen()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Payment Details",
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
      ),
    );
  }
}
