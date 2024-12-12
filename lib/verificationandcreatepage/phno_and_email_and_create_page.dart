import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerificationPage extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String role;

  const VerificationPage({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    super.key,
  });

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isEmailVerified = false;
  bool isPhoneVerified = false;
  String? verificationId;
  final TextEditingController _otpController = TextEditingController();

  // Email verification
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      setState(() {
        isEmailVerified = true; // Set after successful action
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email verification sent to ${widget.email}')),
      );
    }
  }

  // Phone verification
  Future<void> verifyPhoneNumber() async {
    String fullPhoneNumber = '+91${widget.phoneNumber}';
    await _auth.verifyPhoneNumber(
      phoneNumber: fullPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        setState(() {
          isPhoneVerified = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Phone verification successful')),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Phone verification failed: ${e.message}')),
        );
      },
      codeSent: (String verId, int? resendToken) {
        setState(() {
          verificationId = verId;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP sent to $fullPhoneNumber')),
        );
      },
      codeAutoRetrievalTimeout: (String verId) {
        setState(() {
          verificationId = verId;
        });
      },
    );
  }

  // Manually verify the OTP
  Future<void> verifyOTP() async {
    if (verificationId != null) {
      String otp = _otpController.text.trim();
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      try {
        await _auth.signInWithCredential(credential);
        setState(() {
          isPhoneVerified = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Phone verification successful')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Request OTP first')),
      );
    }
  }

  // Add user to Firestore after successful verification
  Future<void> createUserInFirestore() async {
    if (isEmailVerified && isPhoneVerified) {
      final uid = _auth.currentUser?.uid;
      if (uid != null) {
        await FirebaseFirestore.instance.collection('app_users').doc(uid).set({
          'name': widget.name,
          'email': widget.email,
          'phone_number': '+91${widget.phoneNumber}',
          'role': widget.role,
          'uid': uid,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account created successfully')),
        );
        Navigator.popUntil(context, (route) => route.isFirst); // Navigate back to the initial screen
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Complete email and phone verification first')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Please verify your email and phone number',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendEmailVerification,
              child: Text('Send Email Verification'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: verifyPhoneNumber,
              child: Text('Send Phone Verification Code'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _otpController,
              decoration: InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: verifyOTP,
              child: Text('Verify OTP'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: createUserInFirestore,
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
