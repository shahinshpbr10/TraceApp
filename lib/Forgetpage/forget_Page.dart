import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import '../Common/appcolor.dart';
import '../Common/textstyles.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: AppColors.appwhite,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.maincolor1, AppColors.maincolor2],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(58),
                      bottomLeft: Radius.circular(58))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                           icon: Icon(Iconsax.arrow_circle_left),
                            onPressed: () {

                            },
                            color: AppColors.appwhite,
                          ),
                        ),
                        Text(
                          "Forget password",
                          style: AppTextStyles.bodyText
                              .copyWith(color: AppColors.appwhite),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Enter your e-mail to reset password",
                        style: AppTextStyles.smallBodyText
                            .copyWith(color: AppColors.appwhite, fontSize: 20)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildTextField(
                "Enter email",
                Iconsax.direct_inbox,
                emailcontroller,
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
            ),
            SvgPicture.asset(
              'assets/svg/forgot.svg',
              width: 200,
              height: 300,
            ),SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Placeholder();
                  }));
                },
                child: Text(
                  'LOGIN',
                  style: AppTextStyles.smallBodyText
                      .copyWith(color: AppColors.appwhite),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.maincolor1,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
}
