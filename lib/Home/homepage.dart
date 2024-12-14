import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:traceapp/Common/appcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom AppBar
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.maincolor1, AppColors.maincolor2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.menu, color: Colors.black),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150', // Replace with actual profile image URL
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Hello,\nShahinsh Pbr',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Filter Section

            SizedBox(height: 10),

            // Carousel Slider
            CarouselSliderExample(),
        SizedBox(height: 10),Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available bus',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),SizedBox(height: 10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterButton(title: 'All types', isActive: true),
                  FilterButton(title: 'Favourite'),
                  FilterButton(title: 'Ac bus'),
                  FilterButton(title: 'Non-Ac'),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Available Bus Cards
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      BusCard(busName: 'Sana Travels'),
                      BusCard(busName: 'Sana Travels'),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.maincolor2,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              // See All Action
                            },
                            child: Text('See All'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Filter Button Widget
class FilterButton extends StatelessWidget {
  final String title;
  final bool isActive;

  const FilterButton({
    Key? key,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isActive ? Colors.black87 : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? Colors.transparent : Colors.grey.shade400,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Bus Card Widget
class BusCard extends StatelessWidget {
  final String busName;

  const BusCard({Key? key, required this.busName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Bus Icon
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image(
                image: AssetImage('assets/Images/busone.png'),
                width: 50,
              ),
            ),
            SizedBox(width: 10),
            // Bus Name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    busName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Number: KL53Q4116",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                  Text(
                    "Type: Ac",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Carousel Slider Widget
class CarouselSliderExample extends StatelessWidget {
  final List<String> images = [
    'https://via.placeholder.com/400x200.png?text=Image+1',
    'https://via.placeholder.com/400x200.png?text=Image+2',
    'https://via.placeholder.com/400x200.png?text=Image+3',
    'https://via.placeholder.com/400x200.png?text=Image+4',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200, // Slider height
        autoPlay: true, // Enable auto-slide
        enlargeCenterPage: true, // Scale up the center image
        viewportFraction: 0.8, // Size of the slider in view
        autoPlayInterval: Duration(seconds: 3), // Slide duration
      ),
      items: images.map((url) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }
}
