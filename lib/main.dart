// ignore_for_file: prefer_const_constructors

import 'package:booking_pesawat/ui/pages/checkout_page.dart';
import 'package:booking_pesawat/ui/pages/choose_seat_page.dart';
import 'package:booking_pesawat/ui/pages/success_checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:booking_pesawat/ui/pages/bonus_page.dart';
import 'package:booking_pesawat/ui/pages/home_page.dart';
import 'package:booking_pesawat/ui/pages/main_page.dart';

import 'ui/pages/get_started_page.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/pages/splash_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      routes: {
        '/': (context) => SplashPage(),
        '/get-started': (context) => GetStartedPage(),
        '/sign-up': (context) => SignUpPage(),
        '/bonus': (context) => BonusPage(),
        '/main': (context) => MainPage(),
        '/home': (context) => HomePage(),
        '/choose': (context) => ChooseSeatPage(),
        '/checkout': (context) => CheckoutPage(),
        '/success': (context) => SuccessCheckoutPage(),
      },
    );
  }
}
