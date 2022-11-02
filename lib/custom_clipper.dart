import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();

    // kordinat garis pola
    path.lineTo(0, size.height);
    path.lineTo(0, size.height - (size.height * 7 / 100));
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - (size.height * 7 / 100));
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
