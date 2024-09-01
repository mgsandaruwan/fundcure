import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:login_signup_flow_app/screens/register_screen.dart';
import 'package:funcure1/next_screen.dart';
import 'package:funcure1/welcome_screen.dart';

class MedicalScreen extends StatefulWidget {
  const MedicalScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MedicalScreenState createState() => _MedicalScreenState();
}

class _MedicalScreenState extends State<MedicalScreen> {
  String? selectedBank;
  String? selectedBranch;
  String? selectedmedicalcategory;


  final Map<String, List<String>> branchNumbers = {
    'Anuradhapura': ['001', '002', '003', '004'],
    'Colombo': ['101', '102', '103', '104'],
    'Badulla': ['201', '202', '203', '204'],
    'Galle': ['301', '302', '303', '304'],
  };

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _benNameController = TextEditingController();
  final TextEditingController _hospController = TextEditingController();
  final TextEditingController _wardController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  void _saveMedicalData(String userUID) async {
    try {
      await firestore.collection('Campaign').doc(userUID).collection('MedicalExpenses').doc(userUID).set({
      'beneficiaryName': _benNameController.text, // Get the beneficiary name from TextFormField controller,
      'districtAdmitted': selectedBank,
      'selectedHospital': selectedBranch,
        'MedicalCategory': selectedmedicalcategory,
        'HOSPAdmissionNo': _hospController.text,
        'WardNo': _wardController.text,
        'ContactNo': _contactController.text,
      // Add other fields as needed
      });
    //Data saved successfully
    print('Data saved to Medical Expenses subcollection in Firestore.');

    // Navigate to the next screen after saving data
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const NextScreen()),
    );
    } catch (e) {
    // Error occurred while saving data
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
                  "Medical Details!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
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
                    controller: _benNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Benificiars Name',
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
                      hintText: 'District of Admited',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                    items: branchNumbers.keys
                        .map(
                          (bank) => DropdownMenuItem<String>(
                            value: bank,
                            child: Text(bank),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedBank = value;
                        selectedBranch = null; // Reset the branch selection
                      });
                    },
                    value: selectedBank,
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
                      hintText: 'Select Hospital',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                    items: (selectedBank != null && branchNumbers.containsKey(selectedBank))
                        ? branchNumbers[selectedBank]!
                            .map(
                              (branch) => DropdownMenuItem<String>(
                                value: branch,
                                child: Text(branch),
                              ),
                            )
                            .toList()
                        : null,
                    onChanged: (value) {
                      setState(() {
                        selectedBranch = value;
                      });
                    },
                    value: selectedBranch,
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
                    value: selectedmedicalcategory,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Select Medical Category',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Accident',
                        child: Text('Accident'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Heart Patient',
                        child: Text('Heart Patient'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Cancer',
                        child: Text('Cancer'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Other Surgeries',
                        child: Text('Other Surgeries'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Others',
                        child: Text('Others'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedmedicalcategory = value;
                      });
                    },
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
                    controller: _hospController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'HOSP Addmision No',
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
                    controller: _wardController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Ward No',
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
                    controller: _contactController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Contact No. ',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            
            // Rest of your form fields and buttons
            
            
            
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
                      color: const Color(0xFF1CBF72),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        User? user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          _saveMedicalData(user.uid);
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
                        builder: (context) => const WelcomeScreen(),
                      ),
                    );
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
