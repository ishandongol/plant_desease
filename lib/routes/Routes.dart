import 'package:flutter/material.dart';
import 'package:plant_disease/screens/details.dart';

class Routes {
  navigateToDetailsScreen(context,file) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPage(file)),
    );
  }
}
