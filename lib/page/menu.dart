import 'package:flutter/material.dart';
import 'package:funcure1/Src/features/authentication/log_or_reg_page.dart';
import 'MyProfile.dart'; // Import your pages
import 'Settings.dart';
import 'Favorite.dart';
import 'AboutUs.dart';
import 'FAQ.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MaterialApp(home: LoginOrRegisterPage()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
          },
          child: Text('Open Menu'),
        ),
      ),
    );
  }
}

void signUserOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  // Navigate back to the home page after logout
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => LoginOrRegisterPage()),
        (route) => false,
  );
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            fontSize: 24, // Increase font size
            fontWeight: FontWeight.bold, // Make text bold
          ),
        ),
        centerTitle: true, // Center align the title
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Expanded(
            child: MenuList(),
          ),
          SizedBox(height: 20), // Add spacing between menu items and logout button
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/fund.png',
                  height: 200,
                  width: 300,
                ),
                // SizedBox(height: 1),
                ElevatedButton(
                  onPressed: () {
                    signUserOut(context);
                  },
                  child: Text('Logout',
                      style: TextStyle(
                      color: Color(0xFF1CBF72),),
                ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MenuItem(title: 'My Profile', icon: Icons.person),
        MenuItem(title: 'Settings', icon: Icons.settings),
        MenuItem(title: 'About Us', icon: Icons.info),
        MenuItem(title: 'FAQ', icon: Icons.help),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  MenuItem({required this.title, required this.icon});

  void _handleTap(BuildContext context) {
    switch (title) {
      case 'My Profile':
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile()));
        break;
      case 'Settings':
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
        break;
      case 'About Us':
        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
        break;
      case 'FAQ':
        Navigator.push(context, MaterialPageRoute(builder: (context) => FAQPage()));
        break;
      default:
      // Handle other menu items or provide an error message
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon), // Add icon to the leading property
      title: Text(title),
      onTap: () => _handleTap(context), // Call the _handleTap function
    );
  }
}
