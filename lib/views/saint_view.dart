import 'package:flutter/material.dart';

class SaintView extends StatelessWidget {
  const SaintView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Saint of the day"),
    ));
  }
}
