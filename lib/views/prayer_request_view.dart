import 'package:flutter/material.dart';
import 'package:hotspot/constants/current_user.dart';
import 'package:hotspot/logic/make_a_prayer.dart';
import 'package:hotspot/sample/prayer_list.dart';
import 'package:hotspot/sample/user_list.dart';
import 'package:provider/provider.dart';

class PrayerRequestView extends StatelessWidget {
  const PrayerRequestView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (_, index) {
            return PrayerView(
              index: index,
            );
          },
          separatorBuilder: (_, index) {
            return const Divider();
          },
          itemCount: prayers.length),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

class PrayerView extends StatelessWidget {
  const PrayerView({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        foregroundImage: NetworkImage(users
            .where((element) => element.uid == prayers[index].uid)
            .first
            .profilePhoto),
      ),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(prayers[index].prayer),
      ),
      subtitle: Consumer<MakeAPrayer>(
        builder: (context, value, child) {
          return (prayers[index].uid == currentUser.uid)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (prayers[index].whoPrayed.length > 1)
                      ? Text("${prayers[index].whoPrayed.length} users prayed")
                      : (prayers[index].whoPrayed.length == 1)
                          ? const Text("1 user prayed")
                          : const Text(""),
                )
              : (value.prayerMade ||
                      prayers[index].whoPrayed.contains(currentUser.uid))
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (prayers[index].whoPrayed.length > 2)
                          ? Text(
                              "You and ${prayers[index].whoPrayed.length - 1} others prayed")
                          : (prayers[index].whoPrayed.length == 2)
                              ? const Text("You and 1 other prayed")
                              : const Text("You prayed"),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<MakeAPrayer>().makeAPrayer(index);
                          },
                          child: const Text("Make a prayer")),
                    );
        },
      ),
    );
  }
}
