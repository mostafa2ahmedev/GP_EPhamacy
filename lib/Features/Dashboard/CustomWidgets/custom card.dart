import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String mainText;
  final String subText;

  const CustomCard({
    Key? key,
    required this.icon,
    required this.mainText,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16,
      child: Container(
        height: MediaQuery.of(context).size.width * 0.45,
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
          color: const Color(0xff31333E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 58),
            Text(
              mainText,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subText,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
