import 'package:flutter/material.dart';

class AppTextStyles {
  // Heading 1 (Largest)
  static final TextStyle heading1 = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 32.0,
    fontWeight: FontWeight.w700, // Bold
  );

  // Heading 2
  static final TextStyle heading2 = TextStyle(
    fontFamily: 'Nunito',

    fontSize: 24.0,
    fontWeight: FontWeight.w900, // Semi-bold
  );

  // Subheading
  static final TextStyle subheading = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 20.0,
    fontWeight: FontWeight.w500, // Medium weight
  );

  // Body text (Normal)
  static final TextStyle bodyText = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16.0,
    fontWeight: FontWeight.w900, // Regular
  );

  // Small body text
  static final TextStyle smallBodyText = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 14.0,
    fontWeight: FontWeight.w400, // Regular
  );

  // Caption text (Smallest)
  static final TextStyle caption = TextStyle(

    fontFamily: 'Nunito',
    fontSize: 12.0,
    fontWeight: FontWeight.w300, // Light
  );
}
