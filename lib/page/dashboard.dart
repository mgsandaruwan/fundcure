import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funcure1/component/projectcomponent.dart';
import 'package:funcure1/page/DetailsScreen.dart';
import 'package:funcure1/page/profilescreen.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> _campaignStream;
  String userName = '';

  void navigateChatBot() {
    dynamic conversationObject = {
      'appId':'32e9a89b85458c80e650d765677398fa7', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
    };

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((clientConversationId) {
      print(
          "Conversation builder success : " + clientConversationId.toString());
    }).catchError((error) {
      print("Conversation builder error : " + error.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserName();
    _campaignStream = _firestore.collection('Campaign').snapshots();
  }

  void _getUserName() async {
    try {
      // Retrieve the user's name from Firestore
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('profile')
          .doc('fName')
          .get(); // Replace 'YOUR_USER_ID' with the actual user ID
      if (snapshot.exists) {
        setState(() {
          userName = snapshot.data()!['fName'] ??
              ''; // Get the 'fname' field from the document
        });
      }
    } catch (e) {
      print('Error getting user name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: navigateChatBot,
        backgroundColor: Color(0xFF8BE0B4),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.chat),
      ),
      body: Column(
        children: [
          // Non-scrolling content (profile logo, welcome, search bar)
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profilescreen()),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Color(0xFF1CBF72),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 25),
                                  child: Text(
                                    'Welcome',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            userName.isNotEmpty
                                ? userName
                                : 'Guest', // Display the username or 'Guest' if empty
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Our Urgent Fundraising Campaigns',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Scrolling content (ProjectComponent items)
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _campaignStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Loading indicator while fetching data
                }

                final List<DocumentSnapshot> documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final data =
                    documents[index].data() as Map<String, dynamic>;

                    // Create a gesture detector to navigate to details screen on tap
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailsScreen(
                              //projectName: data['campaign'] ?? '',
                              //projectDescription: data['description'] ?? 'No Description',
                              //projectStatus: data['status'] ?? 'No Status',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: ProjectComponent(
                          projectName: data['campaign'] ?? '',
                          projectDescription:
                          data['description'] ?? 'No Description',
                          projectStatus: data['status'] ?? 'No Status',
                          verified: data['verify'] ?? 'Not Verified',
                        ),
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