// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_web_libraries_in_flutter

import 'package:booking_pesawat/cubit/auth_cubit.dart';
import 'package:booking_pesawat/cubit/destination_cubit.dart';
import 'package:booking_pesawat/models/user_destination_model.dart';
import 'package:booking_pesawat/ui/widget/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:booking_pesawat/shared/theme.dart';
import 'package:booking_pesawat/ui/widget/custom_subtitle.dart';
import 'package:booking_pesawat/ui/widget/custom_title.dart';
import 'package:booking_pesawat/ui/widget/destination_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                top: 30,
                left: 24,
                right: 24,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTitle(
                          title: 'Howdy,\n${state.user.name}',
                        ),
                        CustomSubTitle(
                          subTitle: 'Where to fly today?',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image_profile.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestination(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.fromLTRB(
          24,
          30,
          24,
          30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: destinations.map((DestinationModel destination) {
            return DestinationCard(destination);
          }).toList()),
        ),
      );
    }

    Widget newDestination() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 140,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 16,
              ),
              child: Text(
                'New This Year',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semibold,
                ),
              ),
            ),
            DestinationTile(
              nameDestination: 'Danau Beratan',
              city: 'Singa Raja',
              imageUrl: 'assets/image_destination6.png',
            ),
            DestinationTile(
              nameDestination: 'Sydney Opera',
              city: 'Australia',
              imageUrl: 'assets/image_destination7.png',
            ),
            DestinationTile(
              nameDestination: 'Roma',
              city: 'Italia',
              imageUrl: 'assets/image_destination8.png',
            ),
            DestinationTile(
              nameDestination: 'Stadion Santiago Bernabeu',
              city: 'Madrid',
              imageUrl: 'assets/image_destination9.png',
            ),
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestination(state.destinations),
              newDestination(),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
