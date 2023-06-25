import 'package:flutter/material.dart';

class CustomDetailsPageImage{
  static show({required String imagePath}){
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(
            imagePath,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}