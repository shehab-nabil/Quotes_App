import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/injection_container.dart';

import 'app.dart';
import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSL();
  Bloc.observer = AppBlocObserver();
  runApp(const QuoteApp());
}
