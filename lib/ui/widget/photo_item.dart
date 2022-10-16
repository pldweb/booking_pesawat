// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:booking_pesawat/shared/theme.dart';

class PhotoItem extends StatelessWidget {
  final String photo;

  const PhotoItem({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 16,
      ),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        image: DecorationImage(
          image: AssetImage(
            photo,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
