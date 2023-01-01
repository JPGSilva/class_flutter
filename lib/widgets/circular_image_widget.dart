import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  final ImageProvider imageProvider;

  final double width;
  final double heigth;
  CircularImageWidget({
    super.key,
    required this.imageProvider,
    this.width = 180,
    this.heigth = 180,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.heigth,
      width: this.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3.0,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: this.imageProvider,
        ),
      ),
    );
  }
}
