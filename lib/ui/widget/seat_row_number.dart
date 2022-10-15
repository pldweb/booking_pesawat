import 'package:flutter/material.dart';
import 'package:booking_pesawat/shared/theme.dart';

class SeatRowNumber extends StatelessWidget {
  final String seatRowNumber;

  const SeatRowNumber({super.key, required this.seatRowNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          defaultRadius,
        ),
      ),
      child: Center(
        child: Text(
          seatRowNumber,
          style: greyTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
