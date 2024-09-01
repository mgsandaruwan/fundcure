import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Stream<QuerySnapshot> _campaignStream;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String selectedCategory = 'Medicine'; // Default category

  @override
  void initState() {
    super.initState();
    _getCampaigns(selectedCategory);
  }

  void _getCampaigns(String category) {
    setState(() {
      _campaignStream = _firestore
          .collection('Campaign')
          .where('category', isEqualTo: category)
          .snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
        title: const Padding(
          // Add padding to the title text
          padding: EdgeInsets.only(top: 5.0), // Increase the top padding as needed
          child: Text(
            'Categories',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _getCampaigns('Medical Expenses');
                    selectedCategory = 'Medical Expenses';
                  },
                  child: Text(
                    'Medicine',
                    style: TextStyle(
                      color: selectedCategory == 'Medical Expenses'
                          ? Color(0xFF3FD27F)
                          : Colors.black,
                      fontWeight: selectedCategory == 'Medical Expenses'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _getCampaigns('Business');
                    selectedCategory = 'Business';
                  },
                  child: Text(
                    'Business',
                    style: TextStyle(
                      color: selectedCategory == 'Business'
                          ? Color(0xFF3FD27F)
                          : Colors.black,
                      fontWeight: selectedCategory == 'Business'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _getCampaigns('Clarity Services');
                    selectedCategory = 'Clarity Services';
                  },
                  child: Text(
                    'Clarity',
                    style: TextStyle(
                      color: selectedCategory == 'Clarity Services'
                          ? Color(0xFF3FD27F)
                          : Colors.black,
                      fontWeight: selectedCategory == 'Clarity Services'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _campaignStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final List<DocumentSnapshot> documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final data =
                    documents[index].data() as Map<String, dynamic>;

                    return Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: ProjectComponent(
                        projectName: data['campaign'] ?? '',
                        projectDescription: data['description'] ?? 'No Description',
                        projectStatus: data['status'] ?? 'No Status',
                        verified: data['verify'] ?? 'verification(N/A)',
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectComponent extends StatelessWidget {
  final String projectName;
  final String projectDescription;
  final String projectStatus;
  final String verified;
  const ProjectComponent({
    Key? key,
    required this.projectName,
    required this.projectDescription,
    required this.projectStatus,
    required this.verified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            projectName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            projectDescription,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            projectStatus,
            style: TextStyle(
              fontSize: 16,
              color: projectStatus == 'Active' ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            verified,
            style: TextStyle(
              fontSize: 16,
              color: verified == 'Verified' ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}