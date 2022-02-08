import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotspot/sample/saint_list.dart';

class SaintView extends StatelessWidget {
  const SaintView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = Random().nextInt(saints.length);
    return Scaffold(
        body: ListView(
      cacheExtent: 1000,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 200,
              child: Image.network(
                saints[index].saintPhoto,
                cacheHeight: 200,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            saints[index].saintName,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Patron",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: saints[index].patron.length,
            itemBuilder: (_, i) {
              return Text("#" + saints[index].patron[i]);
            },
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            saints[index].saintDescription,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    ));
  }
}
