import 'package:flutter/material.dart';
import 'package:hotspot/sample/prayer_list.dart';
import 'package:hotspot/sample/user_list.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: prayers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 5)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundImage: NetworkImage(users
                            .where(
                                (element) => element.uid == prayers[index].uid)
                            .first
                            .profilePhoto),
                      ),
                    ),
                  ),
                  tileColor: Colors.white,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(prayers[index].prayer),
                  ),
                  subtitle: const ElevatedButton(
                      onPressed: null, child: Text("Pray"))),
            ),
          );
        });
  }
}
