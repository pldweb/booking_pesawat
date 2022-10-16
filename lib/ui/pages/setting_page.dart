// ignore_for_file: prefer_const_constructors, unused_import

import 'package:booking_pesawat/cubit/auth_cubit.dart';
import 'package:booking_pesawat/cubit/cubit_cubit.dart';
import 'package:booking_pesawat/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:booking_pesawat/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Center(
          child: CustomButton(
            title: 'Sign Out',
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
          ),
        );
      },
    );
  }
}
