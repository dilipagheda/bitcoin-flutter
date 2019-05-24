import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatelessWidget {
  final bool isLoading;
  Spinner({this.isLoading});
  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Container(
        height: 0,
        width: 0,
      );
    }
    return SpinKitWave(
      itemBuilder: (_, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.orange : Colors.orangeAccent,
          ),
        );
      },
    );
  }
}
