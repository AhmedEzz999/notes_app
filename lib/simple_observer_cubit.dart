import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleObserverCubit implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('${bloc.runtimeType} changed: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('${bloc.runtimeType} closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('${bloc.runtimeType} created');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('${bloc.runtimeType} error: $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
