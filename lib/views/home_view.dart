import 'package:flutter/material.dart';
import 'package:hotspot/bloc/page_bloc.dart';
import 'package:hotspot/views/prayer_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotspot'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(SettingsPagePressed());
                },
                child: const Icon(Icons.settings_outlined)),
          )
        ],
      ),
      body: BlocBuilder<PageBloc, String>(
        builder: (context, state) {
          return (state == 'prayer')
              ? const PrayerView()
              : (state == 'saint')
                  ? const SaintView()
                  : (state == 'thanks')
                      ? const ThanksView()
                      : (state == 'profile')
                          ? const ProfileView()
                          : const SettingsView();
        },
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BlocBuilder<PageBloc, String>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: (state == 'prayer')
                ? 0
                : (state == 'saint')
                    ? 1
                    : (state == 'thanks')
                        ? 2
                        : (state == 'profile')
                            ? 3
                            : 3,
            onTap: (index) {
              switch (index) {
                case 0:
                  context.read<PageBloc>().add(PrayerPagePressed());
                  break;
                case 1:
                  context.read<PageBloc>().add(SaintPagePressed());
                  break;
                case 2:
                  context.read<PageBloc>().add(ThanksPagePressed());
                  break;
                case 3:
                  context.read<PageBloc>().add(ProfilePagePressed());
                  break;
              }
            },
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_people), label: "Prayer zone"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_events_outlined),
                  label: "Saint of the Day",
                  activeIcon: Icon(Icons.emoji_events)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: "Thanks",
                  activeIcon: Icon(Icons.favorite)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
          );
        },
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings'));
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile'));
  }
}

class ThanksView extends StatelessWidget {
  const ThanksView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Thanks'));
  }
}

class SaintView extends StatelessWidget {
  const SaintView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Saint of the day'));
  }
}
