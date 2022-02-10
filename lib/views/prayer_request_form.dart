import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotspot/constants/current_user.dart';
import 'package:hotspot/logic/prayer_request_form_launch.dart';
import 'package:hotspot/models/prayer_model.dart';
import 'package:hotspot/sample/prayer_list.dart';
import 'package:provider/provider.dart';

class PrayerRequestForm extends StatelessWidget {
  PrayerRequestForm({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Theme.of(context).backgroundColor,
        Theme.of(context).canvasColor
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Container(
        color: Theme.of(context).cardColor.withOpacity(0.7),
        child: Stack(children: [
          Positioned(
            top: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                decoration: const BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Text(
                    "Hi " + currentUser.uid + " 👋🏻",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controller,
                          maxLines: 5,
                          autofocus: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isCollapsed: false,
                            hintText: 'Enter your prayer request',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: GestureDetector(
                        onTap: () {
                          if (_controller.value.text != "") {
                            prayers.add(Prayer(_controller.value.text, false,
                                currentUser.uid, []));
                            context
                                .read<PrayerRequestFormLaunch>()
                                .closePrayerRequest();
                          }
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).canvasColor,
                              ),
                              child: const Center(
                                  child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Send',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ))),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        context
                            .read<PrayerRequestFormLaunch>()
                            .closePrayerRequest();
                      },
                      child: Text(
                        'cancel',
                        style: Theme.of(context).textTheme.bodyText1,
                      ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
