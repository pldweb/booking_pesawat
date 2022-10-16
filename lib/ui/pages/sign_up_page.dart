// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable

import 'package:booking_pesawat/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:booking_pesawat/shared/theme.dart';
import 'package:booking_pesawat/ui/widget/custom_button.dart';
import 'package:booking_pesawat/ui/widget/custom_text_form_field.dart';
import 'package:booking_pesawat/ui/widget/custom_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        padding: EdgeInsets.only(
          right: 50,
          top: 50,
        ),
        child: CustomTitle(
          title: 'Join us and get your next journey',
        ),
      );
    }

    Widget nameInput() {
      return CustomTextFormField(
        name: 'Full Name',
        hintText: 'Your Full Name',
        controller: nameController,
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

    Widget hobbyInput() {
      return CustomTextFormField(
        name: 'Hobby',
        hintText: 'Hobby',
        controller: hobbyController,
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/bonus', (route) => false);
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
            title: 'Get Started',
            onPressed: () {
              print(passwordController.text);

              context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    hobby: hobbyController.text,
                  );
            },
          );
        },
      );
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
