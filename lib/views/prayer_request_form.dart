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
    return Scaffold(
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
            TextField(
              controller: _controller,
              maxLines: 10,
              autofocus: true,
              decoration: const InputDecoration(
                isCollapsed: false,
                border: OutlineInputBorder(),
                hintText: 'Enter your prayer request',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_controller.value.text != "") {
                      prayers.add(Prayer(
                          _controller.value.text, false, currentUser.uid, []));
                      context
                          .read<PrayerRequestFormLaunch>()
                          .closePrayerRequest();
                    }
                  },
                  child: const Text('Send')),
            ),
            TextButton(
                onPressed: () {
                  context.read<PrayerRequestFormLaunch>().closePrayerRequest();
                },
                child: const Text('cancel'))
          ],
        ),
      ),
    );
  }
}
