import 'package:flutter/material.dart';

// Container'lar çok fazla ve aynı old. için oluşturduk.
class MyContainer extends StatelessWidget {
  // burada MyContainer'i çağırdığımızda renk özelliği vermeyi getirdik.
  final Color renk;
  final Widget child;
  final Function onPress;

  MyContainer({this.renk = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: renk),
      ),
    );
  }
}
