import 'package:flutter/material.dart';
import 'package:hotspot/logic/thank_you_form_launch.dart';
import 'package:hotspot/sample/thank_you_list.dart';
import 'package:hotspot/sample/user_list.dart';
import 'package:hotspot/views/thank_you_form.dart';
import 'package:provider/provider.dart';

class ThanksGivingView extends StatelessWidget {
  const ThanksGivingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThankYouFormLaunch>(
      builder: (context, ThankYouFormLaunch status, child) {
        return (status.thankYouFormStatus)
            ? ThankYouForm()
            : Scaffold(
                body: ListView.separated(
                    cacheExtent: 1000,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            foregroundImage: NetworkImage(users
                                .where((element) =>
                                    element.uid == thankyou[index].uid)
                                .first
                                .profilePhoto),
                          ),
                          title: Text(thankyou[index].thankyou),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return const Divider();
                    },
                    itemCount: thankyou.length),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => {
                    context.read<ThankYouFormLaunch>().openThankYouForm(),
                  },
                  child: const Icon(Icons.add),
                ),
              );
      },
    );
  }
}
