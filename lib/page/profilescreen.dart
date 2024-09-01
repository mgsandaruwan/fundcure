import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profilescreen extends StatefulWidget {
  const profilescreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _prifileScreenState createState() => _prifileScreenState();
}

class _prifileScreenState extends State<profilescreen> {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _AddressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Profile Updated Successfully'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _saveToFirestore(String userUID) async {
    final CollectionReference campaigns =
    FirebaseFirestore.instance.collection('profile');

    try {
      await campaigns.doc(userUID).set({
        'fName':_firstNameController.text,
        'lName': _lastNameController.text,
        'address': _AddressController.text,
        'date': _dateController.text,
        'bio': _bioController.text,
        'email': _emailController.text,
        'contact': _contactNumberController.text,

        // Add other fields as needed
      });

      // Data saved successfully
      print('Data saved to Firestore.');
      _showSuccessDialog();
    } catch (e) {
      // Error occurred while saving data
      print('Error saving data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: 375,
            height: 930,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 86,
                  top: 63,
                  child: Container(
                    width: 204,
                    height: 204,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 161,
                  top: 153,
                  child: Text(
                    'Image',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 315,
                  child: Container(
                    width: 325,
                    height: 49,
                    decoration: ShapeDecoration(
                      color: Color(0x7FF6F6F6),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 378,
                  child: Container(
                    width: 325,
                    height: 49,
                    decoration: ShapeDecoration(
                      color: Color(0x7FF6F6F6),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 441,
                  child: Container(
                    width: 325,
                    height: 49,
                    decoration: ShapeDecoration(
                      color: Color(0x7FF6F6F6),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                // First Name TextField
                Positioned(
                  left: 25,
                  top: 315,
                  child: Material(
                    child: Container(
                      width: 325,
                      height: 49,
                      decoration: ShapeDecoration(
                        color: Color(0x7FF6F6F6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                  ),
                ),

                // Last Name TextField
                Positioned(
                  left: 25,
                  top: 378,
                  child: Material(
                    child: Container(
                      width: 325,
                      height: 49,
                      decoration: ShapeDecoration(
                        color: Color(0x7FF6F6F6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Last Name',
                        ),
                      ),
                    ),
                  ),
                ),

                // Address TextField
                Positioned(
                  left: 25,
                  top: 441,
                  child: Material(
                    child: Container(
                      width: 325,
                      height: 49,
                      decoration: ShapeDecoration(
                        color: Color(0x7FF6F6F6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        controller: _AddressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Address',
                        ),
                      ),
                    ),
                  ),
                ),

                // Date of Birth TextField
                Positioned(
                  left: 25,
                  top: 510,
                  child: Material(
                    child: Container(
                      width: 325,
                      height: 49,
                      decoration: ShapeDecoration(
                        color: Color(0x7FF6F6F6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Date of Birth       DD/MM/YY',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 575,
                  child: Material(
                    child: Container(
                      width: 325,
                      height: 52,
                      decoration: ShapeDecoration(
                        color: Color(0x7FF6F6F6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  top: 640,
                  child: Material(
                    child: Container(
                      width: 325,
                      height: 52,
                      decoration: ShapeDecoration(
                        color: Color(0x7FF6F6F6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        controller: _contactNumberController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Contact Number',
                        ),
                      ),
                    ),
                  ),
                ),
                // Bio TextField
                Positioned(
                  left: 25,
                  top: 705,
                  child: Material(
                    child: Container(
                      width: 325,
                      height: 130,
                      decoration: ShapeDecoration(
                        color: Color(0x7FF6F6F6),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFC5C5C5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        controller: _bioController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                          hintText: 'Bio',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 850,
                  left: 50,
                  right:50 ,
                  child: InkWell(
                    onTap: () {
                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        _saveToFirestore(user.uid);
                      }
                    },
                    child:  AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFF1CBF72),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF1CBF72),
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),

      ),
    );
  }
}
