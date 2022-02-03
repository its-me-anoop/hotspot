import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotspot/bloc/bloc_observer.dart';
import 'package:hotspot/bloc/page_bloc.dart';
import 'package:hotspot/cubit/theme_cubit.dart';
import 'package:hotspot/views/home_view.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  /// {@macro app}
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotspot',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider(
        create: (context) => PageBloc(),
        child: const HomeView(),
      ),
    );
  }
}
