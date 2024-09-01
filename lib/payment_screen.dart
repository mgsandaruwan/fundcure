import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:login_signup_flow_app/screens/register_screen.dart';
import 'package:funcure1/confirm_screen.dart';
import 'package:funcure1/welcome_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override

  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedBank;
  String? selectedBranch;
  String? selectAccountType;

  final TextEditingController _accountHolderNameController = TextEditingController();
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _contactNoController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();

  final Map<String, List<String>> branchNumbers = {
    'Commercial Bank': ['001', '002', '003', '004'],
    'Peoples Bank': ['101', '102', '103', '104'],
    'Bank Of Ceylon': ['201', '202', '203', '204'],
    'Others': ['301', '302', '303', '304'],
  };

  Future<void> _storePaymentDetails(String userUID) async {

    try {
      await FirebaseFirestore.instance
          .collection('Campaign')
          .doc(userUID)
          .collection('MedicalExpenses')
          .doc(userUID)
          .collection('PaymentDetails')
          .doc(userUID)
          .set({
        'accountHolderName': _accountHolderNameController.text,
        'selectedBank': selectedBank,
        'selectedBranch': selectedBranch,
        'selectAccountType': selectAccountType,
        'accountNo': _accountNoController.text,
        'contactNo': _contactNoController.text,
        'Target amount': _targetController.text,
        // Add other fields as needed
      });

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const ConfirmScreen()),
      // );
    } catch (e) {
      print('Error storing payment details: $e');
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
                  "Payment Details!",
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
                    controller: _accountHolderNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Account Holder Name',
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
                      hintText: 'Select Your Bank',
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
                      hintText: 'Select Branch No',
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
                    value: selectAccountType,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Select Account Type',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Category 1',
                        child: Text('Current Account'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Category 2',
                        child: Text('Savings Account'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Category 3',
                        child: Text('Joint Account'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Category 4',
                        child: Text('Other'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectAccountType = value;
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
                    controller: _accountNoController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Account No',
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
                    controller: _accountHolderNameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Account Holder Name',
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
                    controller: _contactNoController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Contact No. of the Bank',
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
                    controller: _targetController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Target Amount',
                      hintStyle: TextStyle(
                        color: Color(0xFF8391A1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                      color: const Color(0xFF19B96A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        User? user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          _storePaymentDetails(user.uid);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConfirmScreen()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Create Campaign",
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
