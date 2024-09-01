import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:login_signup_flow_app/screens/register_screen.dart';
import 'package:funcure1/next_screen.dart';
import 'package:funcure1/welcome_screen.dart';

class ClarityScreen extends StatefulWidget {
  const ClarityScreen({Key? key}) : super(key: key);

  @override
  _ClarityScreenState createState() => _ClarityScreenState();
}

class _ClarityScreenState extends State<ClarityScreen> {
  String? selectedBank;
  String? selectedBranch;
  String? selectedprojecttype;
  final Map<String, List<String>> branchNumbers = {
    'Colmbo': ['001', '002', '003', '004'],
    'Badulla': ['101', '102', '103', '104'],
    'Galle': ['201', '202', '203', '204'],
    'Monaragala': ['301', '302', '303', '304'],
  };
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _benNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _supervisorNameController = TextEditingController();
  final TextEditingController _scontactController = TextEditingController();

  void _saveClarityData(String userUID) async {
    try {
      await firestore.collection('Campaign').doc(userUID).collection('Clarity').doc(userUID).set({
        'beficiaryName': _benNameController.text, // Get the beneficiary name from TextFormField controller,
        'ProjectDistrict': selectedBank,
        'projectArea': selectedBranch,
        'projectType': selectedprojecttype,
        'CompantName': _companyNameController.text,
        'SupervisorName': _supervisorNameController.text,
        'ContactNo': _scontactController.text,
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
          color: Colors.black,
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
                  "Clarity Details!",
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
                      hintText: 'Benifactors Name',
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
                      hintText: 'Project District',
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
                      hintText: 'Area ',
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
                    value: selectedprojecttype,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Project Type',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Community Services',
                        child: Text('Community Services'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'School Funding',
                        child: Text('School Funding'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Elders Homes',
                        child: Text('Elders Homes'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Hospitals',
                        child: Text('Hospitals'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedprojecttype = value;
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
                    controller: _companyNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Company/Institution Name',
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
                    controller: _supervisorNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Supervisor Name',
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
                    controller: _scontactController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Supervisors Contact No.',
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
                          _saveClarityData(user.uid);
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
