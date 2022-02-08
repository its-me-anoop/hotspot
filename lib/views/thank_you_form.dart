import 'package:flutter/material.dart';
import 'package:hotspot/constants/current_user.dart';
import 'package:hotspot/logic/thank_you_form_launch.dart';
import 'package:hotspot/models/thanks_model.dart';
import 'package:hotspot/sample/thank_you_list.dart';
import 'package:provider/provider.dart';

class ThankYouForm extends StatelessWidget {
  ThankYouForm({Key? key}) : super(key: key);

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
                hintText: 'Enter your thank you message',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_controller.value.text != "") {
                      thankyou.add(
                          ThankYou(_controller.value.text, currentUser.uid));
                      context.read<ThankYouFormLaunch>().closeThankYouForm();
                    }
                  },
                  child: const Text('Send')),
            ),
            TextButton(
                onPressed: () {
                  context.read<ThankYouFormLaunch>().closeThankYouForm();
                },
                child: const Text('cancel'))
          ],
        ),
      ),
    );
  }
}
