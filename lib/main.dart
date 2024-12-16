import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:traceapp/Admin/bottomnavadmin/bottomnavadmin.dart';
import 'package:traceapp/Admin/bottomnavadmin/home/adminhome.dart';
import 'package:traceapp/Passenger/SplashPage/splashpage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AdminBottomNavBar(),

    );
  }
}
