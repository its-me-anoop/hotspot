import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotspot/constants/current_user.dart';
import 'package:hotspot/constants/special_intention.dart';
import 'package:hotspot/logic/make_a_prayer.dart';
import 'package:hotspot/logic/prayer_request_form_launch.dart';
import 'package:hotspot/sample/prayer_list.dart';
import 'package:hotspot/sample/user_list.dart';
import 'package:hotspot/views/bottom_nav.dart';
import 'package:hotspot/views/prayer_request_form.dart';
import 'package:hotspot/views/settings_page.dart';
import 'package:provider/provider.dart';

class PrayerRequestView extends StatelessWidget {
  const PrayerRequestView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerRequestFormLaunch>(
      builder: (context, PrayerRequestFormLaunch status, child) {
        return (status.prayerRequestFormStatus)
            ? PrayerRequestForm()
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Theme.of(context).backgroundColor,
                  Theme.of(context).canvasColor
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Container(
                  color: Theme.of(context).cardColor.withOpacity(0.5),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        ),
                      ),
                      Scaffold(
                        backgroundColor: Colors.transparent,
                        body: CustomScrollView(
                          slivers: [
                            CupertinoSliverNavigationBar(
                              brightness: Theme.of(context).brightness,
                              largeTitle: const Text("Prayer Requests"),
                              backgroundColor: Colors.transparent,
                              trailing: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SettingsPage()));
                                  },
                                  child: const Icon(
                                      CupertinoIcons.ellipsis_circle)),
                            ),
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 10,
                                  child: Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                            colors: [
                                              Theme.of(context).backgroundColor,
                                              Theme.of(context).canvasColor
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight)),
                                    child: Stack(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32, vertical: 16.0),
                                            child: Card(
                                              elevation: 10,
                                              shadowColor: Colors.black26,
                                              color: Theme.of(context)
                                                  .cardColor
                                                  .withOpacity(0.3),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                  height: 200,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Stack(
                                                      children: [
                                                        Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      gradient: LinearGradient(
                                                                          colors: [
                                                                            Theme.of(context).backgroundColor,
                                                                            Theme.of(context).canvasColor
                                                                          ],
                                                                          begin: Alignment
                                                                              .topLeft,
                                                                          end: Alignment
                                                                              .bottomRight),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50)),
                                                                ),
                                                                Container(
                                                                  height: 80,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      gradient: LinearGradient(
                                                                          colors: [
                                                                            Theme.of(context).backgroundColor,
                                                                            Theme.of(context).canvasColor
                                                                          ],
                                                                          begin: Alignment
                                                                              .topLeft,
                                                                          end: Alignment
                                                                              .bottomRight),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50)),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 0,
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                                    sigmaX: 15,
                                                                    sigmaY: 15),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              50))),
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                            child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            specialIntention,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                shadows: [
                                                                  Shadow(
                                                                      color: Colors
                                                                          .black26,
                                                                      blurRadius:
                                                                          10,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              2))
                                                                ]),
                                                          ),
                                                        ))
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  cacheExtent: 500,
                                  itemBuilder: (_, index) {
                                    return PrayerView(
                                      index: index,
                                    );
                                  },
                                  itemCount: prayers.length),
                              const SizedBox(
                                height: 200,
                              )
                            ]))
                          ],
                        ),
                        floatingActionButton: FloatingActionButton(
                          onPressed: () => {
                            context
                                .read<PrayerRequestFormLaunch>()
                                .openPrayerRequest(),
                          },
                          child: const Icon(Icons.add),
                        ),
                        extendBody: true,
                        bottomNavigationBar: const BottomNav(),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class PrayerView extends StatelessWidget {
  const PrayerView({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        color: Theme.of(context).cardColor.withOpacity(0.5),
        elevation: 5,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Stack(
              children: [
                // Positioned(
                //   top: 0,
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         border: BoxBorder(),
                //           borderRadius: BorderRadius.all(Radius.circular(50))),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            foregroundImage: NetworkImage(users
                                .where((element) =>
                                    element.uid == prayers[index].uid)
                                .first
                                .profilePhoto),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              prayers[index].uid,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          prayers[index].prayer,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Divider(),
                      Consumer<MakeAPrayer>(
                        builder: (context, value, child) {
                          return (prayers[index].uid == currentUser.uid)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: (prayers[index].whoPrayed.length > 1)
                                      ? Text(
                                          "${prayers[index].whoPrayed.length} users prayed")
                                      : (prayers[index].whoPrayed.length == 1)
                                          ? const Text("1 user prayed")
                                          : const Text(""),
                                )
                              : (value.prayerMade ||
                                      prayers[index]
                                          .whoPrayed
                                          .contains(currentUser.uid))
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: (prayers[index].whoPrayed.length >
                                              2)
                                          ? Text(
                                              "You and ${prayers[index].whoPrayed.length - 1} others prayed")
                                          : (prayers[index].whoPrayed.length ==
                                                  2)
                                              ? const Text(
                                                  "You and 1 other prayed")
                                              : const Text("You prayed"),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<MakeAPrayer>()
                                                .makeAPrayer(index);
                                          },
                                          child: const Text("Make a prayer")),
                                    );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
