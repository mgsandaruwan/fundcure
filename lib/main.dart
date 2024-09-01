import 'package:flutter/material.dart';
import 'package:funcure1/Src/features/authentication/log_or_reg_page.dart';
import 'package:funcure1/page/dashboard.dart';
import 'package:funcure1/page/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:funcure1/src/features/authentication/screens/wrapper/wrapper.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Create a custom MaterialColor using the desired color
    MaterialColor customColor = MaterialColor(0xFF1CBF72, {
      50: Color(0xFFE1F7EB),
      100: Color(0xFFB6EACF),
      200: Color(0xFF8BE0B4),
      300: Color(0xFF5FD695),
      400: Color(0xFF3FD27F),
      500: Color(0xFF1CBF72), // Your desired color
      600: Color(0xFF19B96A),
      700: Color(0xFF16B160),
      800: Color(0xFF13A956),
      900: Color(0xFF0DA844),
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'poppins',
        primarySwatch: customColor, // Use the custom MaterialColor
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}
