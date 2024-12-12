import 'package:flutter/material.dart';

import '../Common/appcolor.dart';
import '../Common/textstyles.dart';
import '../verificationandcreatepage/phno_and_email_and_create_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _selectedRole;
  final List<String> _roles = ['Super Admin', 'Traveler'];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Helper method to build a text field with validation
  Widget _buildTextField(
      String label, IconData icon, TextEditingController controller,
      {bool isPassword = false, required String? Function(String?) validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.1),
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: validator,
      ),
    );
  }

  // Helper method to build the role dropdown with validation
  Widget _buildRoleDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButtonFormField<String>(
        dropdownColor: AppColors.maincolor1,
        value: _selectedRole,
        onChanged: (newValue) {
          setState(() {
            _selectedRole = newValue;
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.1),
          labelText: 'Select Role',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a role';
          }
          return null;
        },
        items: _roles.map((role) {
          return DropdownMenuItem(
            value: role,
            child: Text(role),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.maincolor1, AppColors.maincolor2],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 30),
                        Center(
                          child: Text(
                            "TRACE",
                            style: AppTextStyles.heading1
                                .copyWith(color: AppColors.appwhite),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Manage • Track • Travel",
                            style: AppTextStyles.smallBodyText
                                .copyWith(color: AppColors.appwhite),
                          ),
                        ),
                        SizedBox(height: 30),
                        _buildTextField(
                          'Full Name',
                          Icons.person,
                          _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          'Phone Number',
                          Icons.phone,
                          _phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          'Email',
                          Icons.email,
                          _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          'Password',
                          Icons.lock,
                          _passwordController,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        _buildRoleDropdown(),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerificationPage(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    phoneNumber: _phoneController.text,
                                    role: _selectedRole!,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Continue',
                            style: AppTextStyles.smallBodyText
                                .copyWith(color: AppColors.appwhite),
                          ),
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
