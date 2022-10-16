import 'dart:convert';

import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final String description;
  final double rating;
  final int price;

  DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.description = '',
    this.rating = 0.0,
    this.price = 0,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        imageUrl: json['imageUrl'],
        description: json['description'],
        rating: json['rating'],
        price: json['price'],
      );

  @override
  List<Object?> get props =>
      [id, name, city, imageUrl, description, rating, price];
}
