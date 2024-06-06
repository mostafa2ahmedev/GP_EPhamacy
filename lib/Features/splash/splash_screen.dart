import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gppharmacy/Features/Auth/Presentation/widgets/Auth_Mobile_Body.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _animation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        Expanded(
          child: AnimatedSplashScreen(
            splash: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Lottie.asset(
                'assets/images/pharmacySplash.json',
                fit: BoxFit.cover,
              ),
            ),
            nextScreen: Scaffold(body: const AuthMobileBody()),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SlideTransition(
          position: _animation,
          child: Text(
            "Al-Biruni",
            style: GoogleFonts.roboto(
                fontSize: 46, letterSpacing: 4, fontWeight: FontWeight.bold),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
