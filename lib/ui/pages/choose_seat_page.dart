// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:booking_pesawat/ui/widget/custom_button.dart';
import 'package:booking_pesawat/ui/widget/custom_title.dart';
import 'package:booking_pesawat/ui/widget/seat_item.dart';
import 'package:booking_pesawat/ui/widget/seat_row_number.dart';
import 'package:flutter/material.dart';
import 'package:booking_pesawat/shared/theme.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        padding: EdgeInsets.only(right: 50),
        child: CustomTitle(
          title: 'Select Your Favorite Seat',
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          children: [
            // NOTE: AVAILABLE
            Container(
              margin: EdgeInsets.only(
                right: 6,
              ),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_available.png',
                  ),
                ),
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle.copyWith(
                fontWeight: regular,
              ),
            ),

            // NOTE: SELECTED
            Container(
              margin: EdgeInsets.only(
                right: 6,
                left: 10,
              ),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_selected.png',
                  ),
                ),
              ),
            ),
            Text(
              'Selected',
              style: blackTextStyle.copyWith(
                fontWeight: regular,
              ),
            ),

            // NOTE: UNAVAILABLE
            Container(
              margin: EdgeInsets.only(
                right: 6,
                left: 10,
              ),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_unavailable.png',
                  ),
                ),
              ),
            ),
            Text(
              'Unvailable',
              style: blackTextStyle.copyWith(
                fontWeight: regular,
              ),
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          children: [
            // NOTE: SEAT INDICATOR
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'A',
                      style: greyTextStyle.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'B',
                      style: greyTextStyle.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '',
                      style: greyTextStyle.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'C',
                      style: greyTextStyle.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'D',
                      style: greyTextStyle.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // NOTE: SEAT 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 0),
                SeatRowNumber(seatRowNumber: '1'),
                SeatItem(status: 2),
                SeatItem(status: 0),
              ],
            ),
            // NOTE: SEAT 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 2),
                SeatRowNumber(seatRowNumber: '2'),
                SeatItem(status: 2),
                SeatItem(status: 0),
              ],
            ),
            // NOTE: SEAT 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 2),
                SeatRowNumber(seatRowNumber: '3'),
                SeatItem(status: 0),
                SeatItem(status: 2),
              ],
            ),
            // NOTE: SEAT 4
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(status: 0),
                SeatItem(status: 2),
                SeatRowNumber(seatRowNumber: '4'),
                SeatItem(status: 0),
                SeatItem(status: 0),
              ],
            ),
            // NOTE: SEAT 5
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(status: 1),
                SeatItem(status: 1),
                SeatRowNumber(seatRowNumber: '5'),
                SeatItem(status: 0),
                SeatItem(status: 0),
              ],
            ),

            // NOTE: YOUR SEAT
            Container(
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your seat',
                    style: greyTextStyle,
                  ),
                  Text(
                    'A3, B3',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: greyTextStyle,
                  ),
                  Text(
                    'IDR 540.000.000',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    checkoutButton() {
      return CustomButton(
        title: 'Continue to Checkout',
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        margin: EdgeInsets.only(
          top: 25,
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.all(defaultMargin),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton(),
        ],
      ),
    );
  }
}
