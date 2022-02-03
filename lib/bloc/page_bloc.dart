import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PageEvent {}

class PrayerPagePressed extends PageEvent {}

class SaintPagePressed extends PageEvent {}

class ThanksPagePressed extends PageEvent {}

class ProfilePagePressed extends PageEvent {}

class SettingsPagePressed extends PageEvent {}

/// {@template counter_bloc}
/// A simple [Bloc] that manages an `int` as its state.
/// {@endtemplate}
class PageBloc extends Bloc<PageEvent, String> {
  /// {@macro counter_bloc}
  PageBloc() : super('prayer') {
    on<PrayerPagePressed>((event, emit) => emit('prayer'));
    on<SaintPagePressed>((event, emit) => emit('saint'));
    on<ThanksPagePressed>((event, emit) => emit('thanks'));
    on<ProfilePagePressed>((event, emit) => emit('profile'));
    on<SettingsPagePressed>((event, emit) => emit('settings'));
  }
}
