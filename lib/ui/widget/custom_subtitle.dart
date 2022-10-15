import 'package:flutter/material.dart';
import 'package:booking_pesawat/shared/theme.dart';

class CustomSubTitle extends StatelessWidget {
  final String subTitle;

  const CustomSubTitle({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: greyTextStyle.copyWith(
        fontSize: 16,
        fontWeight: light,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
