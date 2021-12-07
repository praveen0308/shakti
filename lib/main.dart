import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shakti/res/custom_colors.dart';
import 'package:shakti/ui/welcome/landing_page.dart';
import 'package:shakti/ui/welcome/welcome_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'route/route.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shakti',
      theme: ThemeData(
        primarySwatch: MyColor.primary,
        fontFamily: 'Konnect',
      ),
      home: LandingPage(),
    );
  }
}
