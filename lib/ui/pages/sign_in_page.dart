// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable

import 'package:booking_pesawat/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:booking_pesawat/shared/theme.dart';
import 'package:booking_pesawat/ui/widget/custom_button.dart';
import 'package:booking_pesawat/ui/widget/custom_text_form_field.dart';
import 'package:booking_pesawat/ui/widget/custom_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        padding: EdgeInsets.only(
          right: 50,
          top: 50,
        ),
        child: CustomTitle(
          title: 'Sign In with your existing account',
        ),
      );
    }

    Widget emailInput() {
      return CustomTextFormField(
        name: 'Email Address',
        hintText: 'Email Address',
        controller: emailController,
      );
    }

    Widget passwordInput() {
      return CustomTextFormField(
        name: 'Password',
        hintText: 'Your Password',
        obscureText: true,
        controller: passwordController,
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            title: 'Sign In',
            onPressed: () {
              print(passwordController.text);

              context.read<AuthCubit>().signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
            },
          );
        },
      );
    }

    Widget signUpButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 30,
            bottom: 10,
          ),
          child: Text(
            'Don\'t have account? Sign Up Now',
            style: greyTextStyle.copyWith(
              fontSize: 15,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    Widget inputSection() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(children: [
          emailInput(),
          passwordInput(),
          submitButton(),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.all(defaultMargin),
        children: [
          title(),
          inputSection(),
          signUpButton(),
        ],
      ),
    );
  }
}
