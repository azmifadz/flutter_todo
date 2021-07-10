import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

// We can extend `BlocObserver` and override `onTransition` and `onError`
// in order to handle transitions and errors from all Blocs.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      // ignore: avoid_print
      print(event);
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      // ignore: avoid_print
      print(transition);
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      // ignore: avoid_print
      print(error);
    }

    super.onError(bloc, error, stackTrace);
  }
}
