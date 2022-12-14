import 'package:booking_pesawat/cubit/auth_cubit.dart';
import 'package:booking_pesawat/cubit/cubit_cubit.dart';
import 'package:booking_pesawat/cubit/destination_cubit.dart';
import 'package:booking_pesawat/ui/pages/checkout_page.dart';
import 'package:booking_pesawat/ui/pages/choose_seat_page.dart';
import 'package:booking_pesawat/ui/pages/success_checkout_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:booking_pesawat/ui/pages/bonus_page.dart';
import 'package:booking_pesawat/ui/pages/home_page.dart';
import 'package:booking_pesawat/ui/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/pages/get_started_page.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/pages/sign_in_page.dart';
import 'ui/pages/splash_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAuth.instance.signInAnonymously();
// Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/home': (context) => HomePage(),
          '/choose': (context) => ChooseSeatPage(),
          '/checkout': (context) => CheckoutPage(),
          '/success': (context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}
