import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:traceapp/Forgetpage/forget_Page.dart';
import 'package:traceapp/bottomnavbar/bottomnavbar.dart';

import '../Common/appcolor.dart';
import '../Common/textstyles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Automatically resize to avoid keyboard overflow
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.maincolor1, AppColors.maincolor2],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                // Lottie animation at the top
                Lottie.asset(
                  'assets/lotties/login.json',
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 110),
                Center(
                  child: Text(
                    "TRACE",
                    style: AppTextStyles.heading1
                        .copyWith(color: AppColors.appwhite),
                  ),
                ),
                Text(
                  "Manage • Track • Travel",
                  style: AppTextStyles.smallBodyText
                      .copyWith(color: AppColors.appwhite),
                ),
                SizedBox(height: 30),
                _buildTextField('Email Id', Icons.email),
                _buildTextField('Password', Icons.lock, isPassword: true),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                      return BottomNavBar();
                    },));
                  },
                  child: Text('LOGIN',style: AppTextStyles.smallBodyText.copyWith(color: AppColors.appwhite),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: AppTextStyles.smallBodyText
                          .copyWith(color: AppColors.appwhite),
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Text(
                        'Sign Up',
                        style: AppTextStyles.bodyText
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                        return ForgetPage();
                      },));
                    },
                      child: Text(
                        'Forget password? ',

                        style: AppTextStyles.smallBodyText
                            .copyWith(color: AppColors.black),
                      ),
                    ),

                  ],
                ),                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.smallBodyText.copyWith(color: Colors.black54),
          filled: true,
          fillColor: Colors.black.withOpacity(0.1), // Lighter background
          prefixIcon: Icon(icon, color: Colors.black54), // Add icon
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: Colors.black), // Change text color
      ),
    );
  }
}
