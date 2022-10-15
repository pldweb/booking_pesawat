// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:booking_pesawat/shared/theme.dart';
import 'package:booking_pesawat/ui/widget/custom_button.dart';
import 'package:booking_pesawat/ui/widget/custom_text_form_field.dart';
import 'package:booking_pesawat/ui/widget/custom_title.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        padding: EdgeInsets.only(right: 50),
        child: CustomTitle(
          title: 'Join us and get your next journey',
        ),
      );
    }

    Widget nameInput() {
      return CustomTextFormField(
        name: 'Full Name',
        hintText: 'Your Full Name',
      );
    }

    Widget emailInput() {
      return CustomTextFormField(
        name: 'Email Address',
        hintText: 'Email Address',
      );
    }

    Widget passwordInput() {
      return CustomTextFormField(
        name: 'Password',
        hintText: 'Your Password',
        obscureText: true,
      );
    }

    Widget hobbyInput() {
      return CustomTextFormField(
        name: 'Hobby',
        hintText: 'Hobby',
      );
    }

    Widget submitButton() {
      return CustomButton(
          title: 'Get Started',
          onPressed: () {
            Navigator.pushNamed(context, '/bonus');
          });
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 30,
          bottom: 10,
        ),
        child: Text(
          'Terms and Condition',
          style: greyTextStyle.copyWith(
            fontSize: 15,
            fontWeight: light,
            decoration: TextDecoration.underline,
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
          nameInput(),
          emailInput(),
          passwordInput(),
          hobbyInput(),
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
          tacButton(),
        ],
      ),
    );
  }
}
